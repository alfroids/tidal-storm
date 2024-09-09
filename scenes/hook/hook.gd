class_name Hook
extends Area2D


signal thrown()
signal pulled()

const SPEED: float = 400.0

var target_depth: float = 800.0


func throw() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"position",
		target_depth * Vector2.DOWN,
		target_depth / SPEED,
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	await tween.finished
	thrown.emit()


func pull() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"position",
		Vector2.ZERO,
		target_depth / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await tween.finished
	pulled.emit()
	queue_free()
