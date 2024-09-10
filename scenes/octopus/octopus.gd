class_name Octopus
extends CharacterBody2D

@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s") var MAX_SPEED: float = 400.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var ACCELARTION: float = 1600.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var DRAG: float = 400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine as StateMachine

func _ready():
	animation_player.play("sleep")

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
