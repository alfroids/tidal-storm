extends CanvasLayer

@onready var calm_timer = CycleManager.calm_timer
@onready var storm_timer = CycleManager.storm_timer

@export var _progress_bar: ProgressBar

func _process(_delta):
	if calm_timer.time_left > 0:
		_progress_bar.value = (calm_timer.time_left / calm_timer.wait_time) * 100
	
	if storm_timer.time_left > 0:
		_progress_bar.value = (1 - storm_timer.time_left / storm_timer.wait_time) * 100
