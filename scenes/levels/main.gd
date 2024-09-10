extends Node2D

@export var _calm_timer: Timer
@export var _storm_timer: Timer
@export var _canvas_modulate: CanvasModulate

func _ready():
	_canvas_modulate.color = Color("#6f8695")

func _on_calm_timer_timeout():
	_storm_timer.start()

	# Tween para mudar a aparência do jogo p/ tempestade
	var tween = create_tween()
	tween.tween_property(_canvas_modulate, "color", Color("#383961"), 1)

func _on_storm_timer_timeout():
	_calm_timer.start()

	# Tween para mudar a aparência do jogo p/ calmaria
	var tween = create_tween()
	tween.tween_property(_canvas_modulate, "color", Color("#6f8695"), 1)
