extends Node


var match_start_time: float
var items_caught: int


func reset_data() -> void:
	match_start_time = Time.get_ticks_msec()
	items_caught = 0
