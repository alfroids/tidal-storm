extends CanvasLayer



@export var _progress_bar: ProgressBar


@onready var calm_timer = CycleManager.calm_timer
@onready var storm_timer = CycleManager.storm_timer

@onready var calm_max_value = calm_timer.wait_time
@onready var storm_max_value = storm_timer.wait_time

func _process(_delta):
	if calm_timer.time_left > 0:
		_progress_bar.get_theme_stylebox("fill").bg_color = Color("#539987")
		_progress_bar.value = (calm_timer.time_left / calm_max_value) * 100
	
	if storm_timer.time_left > 0:
		_progress_bar.get_theme_stylebox("fill").bg_color = Color("#a30b37")
		_progress_bar.value = (1 - storm_timer.time_left / storm_max_value) * 100

 #styleBox = $ProgressBar.get("custom_styles/fg")
	#styleBox.bg_color = Color(r, g, 0)
