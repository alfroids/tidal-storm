extends Node

@export var _orb_manager: Node2D
@export var _sunlight: DirectionalLight2D

#@export var _anim: AnimationPlayer
#
func _ready() -> void:
	CycleManager.cycle_started.connect(_orbs_visibility) # aqui eu pego o sinal emitido pelo autoload?

func _orbs_visibility(phase: CycleManager.PHASE) -> void:
		if phase == CycleManager.PHASE.CALM:
			_orb_manager.visible = false
			
			var tween = get_tree().create_tween()
			tween.tween_property(_sunlight, "energy", 0.5, 1)
		
		elif phase == CycleManager.PHASE.STORM:
			_orb_manager.visible = true
			
			var tween = get_tree().create_tween()
			tween.tween_property(_sunlight, "energy", 0.15, 1)
