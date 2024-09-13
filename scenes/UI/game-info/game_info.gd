extends Control


@export var _progress_bar: ProgressBar

@onready var calm_timer = CycleManager.calm_timer
@onready var storm_timer = CycleManager.storm_timer
@onready var calm_max_value = calm_timer.wait_time
@onready var storm_max_value = storm_timer.wait_time


func _process(_delta):
	if CycleManager.current_phase == CycleManager.PHASE.CALM:
		var percentage: float = calm_timer.time_left / calm_max_value
		var color: Color = Color("#3b5249").lerp(Color("#8c1c13"), 1 - percentage)
		_progress_bar.get_theme_stylebox("fill").bg_color = color
		_progress_bar.value = 100 * percentage

	if CycleManager.current_phase == CycleManager.PHASE.STORM:
		_progress_bar.get_theme_stylebox("fill").bg_color = Color("#6f8695")
		_progress_bar.value = (1 - storm_timer.time_left / storm_max_value) * 100
