extends Control

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "proverb_fade_out":
		get_tree().change_scene_to_file("res://scenes/levels/main.tscn")
		CycleManager.start_cycles()
