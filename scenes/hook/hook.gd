class_name Hook
extends Area2D


const SPEED: float = 400.0

var target_depth: float = 0.0


func _ready() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"global_position",
		Vector2(global_position.x, target_depth),
		target_depth / SPEED
	).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
