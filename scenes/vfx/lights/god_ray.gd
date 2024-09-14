extends Node2D

@export var _godray_light: PointLight2D

func _ready() -> void:
	CycleManager.cycle_started.connect(_godray_energy_change)

func _godray_energy_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		var tween = get_tree().create_tween()
		tween.tween_property(_godray_light, "energy", 0.8, 3).set_trans(Tween.TRANS_BOUNCE)

	elif phase == CycleManager.PHASE.STORM:
		var tween = get_tree().create_tween()
		tween.tween_property(_godray_light, "energy", 0, 3)
