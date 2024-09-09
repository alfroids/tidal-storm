extends Node2D

@export var _calm_timer: Timer
@export var _storm_timer: Timer

func _on_calm_timer_timeout():
	_storm_timer.start()
	print("Hora da tempestade")

func _on_storm_timer_timeout():
	_calm_timer.start()
	print("Hora da Calmaria")
