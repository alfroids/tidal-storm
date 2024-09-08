class_name Fish
extends CharacterBody2D



const MAX_SPEED: float = 400.0
const ACCELARTION: float = 1500.0
const DRAG: float = 600.0

@onready var move_speed: float = 0.0


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
