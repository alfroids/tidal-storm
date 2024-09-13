extends Control


func _ready() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		if not get_tree().paused:
			get_tree().paused = true
			visible = true


func _on_return_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	CycleManager.start_cycles()
	Data.reset_data()
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
