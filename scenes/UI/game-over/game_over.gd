extends Control


func _ready() -> void:
	visible = false
	SignalBus.player_was_hooked.connect(_on_player_was_hooked)


func _on_player_was_hooked() -> void:
	get_tree().paused = true
	visible = true


func _on_play_again_button_pressed() -> void:
	get_tree().paused = false
	CycleManager.start_cycles()
	Data.reset_data()
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
