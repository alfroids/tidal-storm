extends Node


signal cycle_started(phase: PHASE)

enum PHASE {CALM, STORM}

@export var calm_timer: Timer
@export var storm_timer: Timer

@onready var current_phase: PHASE = PHASE.CALM


func _on_calm_timer_timeout() -> void:
	#print("calm ended")
	storm_timer.start()
	current_phase = PHASE.STORM
	cycle_started.emit(PHASE.STORM)


func _on_storm_timer_timeout() -> void:
	#print("storm ended")
	calm_timer.start()
	current_phase = PHASE.CALM
	cycle_started.emit(PHASE.CALM)


func delay_cycle_timer(delay: float) -> void:
	if current_phase == PHASE.STORM:
		storm_timer.start(storm_timer.time_left + delay)
	elif current_phase == PHASE.CALM:
		calm_timer.start(calm_timer.time_left + delay)
	else:
		print("ue")
