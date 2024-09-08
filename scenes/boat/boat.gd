class_name Boat
extends Sprite2D


signal pulled_hook(boat: Boat)

const SPEED: float = 200.0

@export var hook_scene: PackedScene
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var min_depth: float = 200.0
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var max_depth: float = 2000.0

@onready var hook_spawn: Marker2D = $HookSpawn as Marker2D


func _ready() -> void:
	launch_hook()


func move_to(x: float) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"global_position",
		Vector2(x, global_position.y),
		x / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(launch_hook)


func launch_hook() -> void:
	var hook: Hook = hook_scene.instantiate() as Hook
	hook.target_depth = randf_range(min_depth, max_depth)
	hook.pulled.connect(pulled_hook.emit.bind(self))
	hook_spawn.add_child(hook)
