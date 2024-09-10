class_name Boat
extends Node2D


signal reached_target_position()
signal pulled_hook(boat: Boat)

const SPEED: float = 200.0

@onready var hook: Hook = $Hook as Hook
@onready var hook_timer: Timer = $HookTimer as Timer


func move_to(pos: Vector2) -> void:
	if hook.armed:
		pull_hook()
		await hook.returned

	var tween: Tween = create_tween()
	tween.tween_property(
		self,
		^"global_position",
		pos,
		global_position.distance_to(pos) / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	reached_target_position.emit()


func throw_hook(depth: float) -> void:
	hook.throw(depth)
	await hook.reached_target_depth
	hook_timer.start()


func pull_hook() -> void:
	hook.pull()


func _on_hook_returned() -> void:
	hook_timer.stop()
	pulled_hook.emit(self)
