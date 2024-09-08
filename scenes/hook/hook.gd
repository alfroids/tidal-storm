class_name Hook
extends Area2D


signal pulled()

const SPEED: float = 400.0

var target_depth: float = 800.0

@onready var pull_timer: Timer = $PullTimer as Timer


func _ready() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"position",
		target_depth * Vector2.DOWN,
		target_depth / SPEED,
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.finished.connect(pull_timer.start)


func _on_pull_timer_timeout() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		self,
		^"position",
		Vector2.ZERO,
		target_depth / SPEED,
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	tween.finished.connect(func():
		pulled.emit()
		queue_free()
	)
