extends Node2D

@export var _orb_light: PointLight2D

func _ready() -> void:
	CycleManager.cycle_started.connect(_orb_energy_change) # aqui eu pego o sinal emitido pelo autoload?

func _orb_energy_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		var tween = get_tree().create_tween()
		tween.tween_property(_orb_light, "energy", 0, 2)
		
	elif phase == CycleManager.PHASE.STORM:
		var tween = get_tree().create_tween()
		tween.tween_property(_orb_light, "energy", 1, 2)
