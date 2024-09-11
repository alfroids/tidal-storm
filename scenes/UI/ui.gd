extends CanvasLayer

@onready var calm_timer = CycleManager.calm_timer
@onready var storm_timer = CycleManager.storm_timer

@export var _progress_bar: ProgressBar

func _process(_delta):
	_progress_bar.value = (calm_timer.time_left / calm_timer.wait_time) * 100
