extends Control


func _ready() -> void:
	visible = false
	SignalBus.player_was_hooked.connect(_on_player_was_hooked)


func _on_player_was_hooked() -> void:
	get_tree().paused = true
	visible = true
