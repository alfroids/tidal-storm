extends Node


signal cycle_started(phase: PHASE)

enum PHASE {CALM, STORM}

@export var calm_timer: Timer
@export var storm_timer: Timer


func _on_calm_timer_timeout() -> void:
	#print("calm ended")
	storm_timer.start()
	cycle_started.emit(PHASE.STORM)


func _on_storm_timer_timeout() -> void:
	#print("storm ended")
	calm_timer.start()
	cycle_started.emit(PHASE.CALM)


func delay_calm_timer(delay: float) -> void:
	calm_timer.start(calm_timer.time_left + delay)
