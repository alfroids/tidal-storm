class_name Fish
extends CharacterBody2D



@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s") var MAX_SPEED: float = 400.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var ACCELARTION: float = 1600.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var DRAG: float = 400.0


func _physics_process(delta: float) -> void:
	var move_x: float = Input.get_action_strength(&"move_right") - Input.get_action_strength(&"move_left")
	var move_y: float = Input.get_action_strength(&"move_down") - Input.get_action_strength(&"move_up")
	var move_dir: Vector2 = Vector2(move_x, move_y).normalized()

	if not move_dir:
		var drag: float = delta * DRAG
		if velocity.length_squared() > drag**2:
			velocity -= drag * velocity.normalized()
		else:
			velocity = Vector2.ZERO
	else:
		velocity += delta * ACCELARTION * move_dir
		velocity = velocity.limit_length(MAX_SPEED)

	move_and_slide()
