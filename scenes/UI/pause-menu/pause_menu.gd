extends Control


func _ready() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		if not get_tree().paused:
			get_tree().paused = not get_tree().paused
			visible = not visible
