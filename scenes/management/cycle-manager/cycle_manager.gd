extends Node


signal cycle_started(phase: PHASE)

enum PHASE {CALM, STORM}

@export var calm_timer: Timer
@export var storm_timer: Timer

@onready var current_phase: PHASE = PHASE.CALM

@onready var calm_wait_time = calm_timer.wait_time
@onready var storm_wait_time = storm_timer.wait_time
@onready var cycle_count: int = 1


func start_cycles() -> void:
	cycle_count = 1
	storm_timer.stop()
	calm_timer.start(calm_wait_time)
	current_phase = PHASE.CALM


func _on_calm_timer_timeout() -> void:
	#print("calm ended")
	storm_timer.start(storm_wait_time)
	current_phase = PHASE.STORM
	cycle_started.emit(PHASE.STORM)


func _on_storm_timer_timeout() -> void:
	#print("storm ended")
	calm_timer.start(calm_wait_time)
	current_phase = PHASE.CALM
	cycle_count += 1
	cycle_started.emit(PHASE.CALM)


func delay_cycle_timer(delay: float) -> void:
	if current_phase == PHASE.STORM:
		storm_timer.start(maxf(0.0, storm_timer.time_left - delay))
	elif current_phase == PHASE.CALM:
		calm_timer.start(calm_timer.time_left + delay)
	else:
		print("ue")
