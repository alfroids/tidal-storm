extends Node

signal cycle_start

@export var calm_timer: Timer
@export var storm_timer: Timer

@onready var previous_cycle = "calm"
@onready var curr_cycle = "calm"

func _on_calm_timer_timeout():
	curr_cycle = "storm"
	cycle_start.emit()
	print("calm ended")
	storm_timer.start()

func _on_storm_timer_timeout():
	curr_cycle = "calm"
	cycle_start.emit()
	print("storm ended")
	calm_timer.start()



# Seu código tá aqui em baixo. Nao quis me livrar dele fhushuessajuh

#signal calm_cycle_started()
#signal calm_cycle_ended()
#signal storm_cycle_started()
#signal storm_cycle_ended()


#@onready var calm_timer: Timer = $CalmTimer as Timer
#@onready var storm_timer: Timer = $StormTimer as Timer

#func start_calm_cycle(time: float = 0.0) -> void:
	#if time:
		#calm_timer.start(time)
	#else:
		#calm_timer.start()
#
	#calm_cycle_started.emit()
#
#
#func start_storm_cycle(time: float = 0.0) -> void:
	#if time:
		#storm_timer.start(time)
	#else:
		#storm_timer.start()
#
	#storm_cycle_started.emit()
#
#
#func _on_calm_timer_timeout() -> void:
	#calm_cycle_ended.emit()
	#start_storm_cycle()
#
#
#func _on_storm_timer_timeout() -> void:
	#storm_cycle_ended.emit()
	#start_calm_cycle()
