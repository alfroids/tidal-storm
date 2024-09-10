class_name Hook
extends Area2D


signal reached_target_depth()
signal returned()

const SPEED: float = 400.0

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D as CollisionShape2D
@onready var armed: bool = false


func _ready() -> void:
	collision_shape_2d.disabled = true


func throw(depth: float) -> void:
	collision_shape_2d.disabled = true
	var tween: Tween = create_tween()
	tween.tween_property(
		self,
		^"position",
		depth * Vector2.DOWN,
		depth / SPEED,
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	await tween.finished
	armed = true
	collision_shape_2d.disabled = false
	reached_target_depth.emit()


func pull() -> void:
	if not armed:
		return

	armed = false
	var tween: Tween = create_tween()
	tween.tween_property(
		self,
		^"position",
		Vector2.ZERO,
		position.y / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await tween.finished
	collision_shape_2d.disabled = true
	returned.emit()


func _on_body_entered(_body: Node2D) -> void:
	pull()
