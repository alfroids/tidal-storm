class_name Octopus
extends CharacterBody2D

@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s") var MAX_SPEED: float = 400.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var ACCELARTION: float = 1600.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var DRAG: float = 400.0

@export var _light: PointLight2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine as StateMachine

func _ready():
	animation_player.play("sleep")
	CycleManager.cycle_started.connect(_octopus_light_change)

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)

func _octopus_light_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		var tween = get_tree().create_tween()
		tween.tween_property(_light, "energy", 0.2, 3)

	elif phase == CycleManager.PHASE.STORM:
		var tween = get_tree().create_tween()
		tween.tween_property(_light, "energy", 1, 3)
