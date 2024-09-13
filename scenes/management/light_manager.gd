extends Node

@export var _orb_manager: Node2D

#@export var _anim: AnimationPlayer
#
func _ready() -> void:
	CycleManager.cycle_started.connect(_orbs_visibility) # aqui eu pego o sinal emitido pelo autoload?

func _orbs_visibility(phase: CycleManager.PHASE) -> void:
		if phase == CycleManager.PHASE.CALM:
			_orb_manager.visible = false
		elif phase == CycleManager.PHASE.STORM:
			_orb_manager.visible = true
