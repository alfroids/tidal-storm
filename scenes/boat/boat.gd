class_name Boat
extends Node2D


signal moved()
#signal threw_hook()
signal pulled_hook(boat: Boat)

const SPEED: float = 200.0

@export var hook_scene: PackedScene
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var min_depth: float = 200.0
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var max_depth: float = 2000.0

var hook: Hook

@onready var hook_spawn: Marker2D = $HookSpawn as Marker2D
@onready var hook_timer: Timer = $HookTimer as Timer


func move_to(pos: Vector2) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"global_position",
		pos,
		global_position.distance_to(pos) / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	moved.emit()


func throw_hook() -> void:
	if is_instance_valid(hook):
		return

	hook = hook_scene.instantiate() as Hook
	hook.target_depth = randf_range(min_depth, max_depth)
	hook_spawn.add_child(hook)
	hook.throw()
	await hook.thrown
	hook_timer.start()


func pull_hook() -> void:
	if not is_instance_valid(hook):
		return

	hook.pull()
	await hook.pulled
	pulled_hook.emit(self)
