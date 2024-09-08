class_name Fish
extends CharacterBody2D


const MOVE_SPEED: float = 400.0


func _physics_process(_delta: float) -> void:
	var move_x: float = Input.get_action_strength(&"move_right") - Input.get_action_strength(&"move_left")
	var move_y: float = Input.get_action_strength(&"move_down") - Input.get_action_strength(&"move_up")
	var move_dir: Vector2 = Vector2(move_x, move_y).normalized()

	velocity = MOVE_SPEED * move_dir

	move_and_slide()
