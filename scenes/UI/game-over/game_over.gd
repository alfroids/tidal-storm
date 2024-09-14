extends Control


@onready var items_collected_label: Label = %ItemsCollectedLabel as Label
@onready var total_time_label: Label = %TotalTimeLabel as Label


func _ready() -> void:
	visible = false
	SignalBus.player_was_hooked.connect(_on_player_was_hooked)


func _on_player_was_hooked() -> void:
	get_tree().paused = true

	items_collected_label.text = "You collected " + str(Data.items_caught) + " items!"
	total_time_label.text = "You survived for " + str(roundi((Time.get_ticks_msec() - Data.match_start_time) / 1000)) + " seconds!"

	visible = true


func _on_play_again_button_pressed() -> void:
	get_tree().paused = false
	CycleManager.start_cycles()
	Data.reset_data()
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
