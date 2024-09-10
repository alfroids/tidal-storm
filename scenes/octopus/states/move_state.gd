extends State


@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s") var max_speed: float = 400.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var acceleration: float = 1600.0
@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s²") var drag: float = 400.0
@export var idle_state: State
@export var dash_state: State

@onready var octopus: Octopus = owner as Octopus
@onready var sprite_2d: Sprite2D = $"../../Sprite2D" as Sprite2D
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer" as AnimationPlayer


## Called when this State is being activated.
func enter(_msg: Dictionary = {}) -> void:
	animation_player.play("swim")


## Called when this State is being deactivated.
func exit() -> void:
	pass


## Intended to handle input events from its [class StateMachine].
func handle_input(_event: InputEvent) -> void:
	pass


## Intended to handle idle processes from its [class StateMachine].
func update(_delta: float) -> void:
	pass


## Intended to handle physics processes from its [class StateMachine].
func physics_update(delta: float) -> void:
	var move_x: float = Input.get_action_strength(&"move_right") - Input.get_action_strength(&"move_left")
	var move_y: float = Input.get_action_strength(&"move_down") - Input.get_action_strength(&"move_up")
	var move_dir: Vector2 = Vector2(move_x, move_y).normalized()

	if Input.is_action_just_pressed(&"dash"):
		change_state(dash_state, {"direction": move_dir})
		return

	if move_x == 1:
		sprite_2d.flip_h = false
	elif move_x == -1:
		sprite_2d.flip_h = true

	octopus.velocity -= delta * drag * octopus.velocity.normalized()

	if not move_dir and octopus.velocity.length_squared() < (delta * drag)**2:
		change_state(idle_state)
		return

	octopus.velocity += delta * acceleration * move_dir
	octopus.velocity = octopus.velocity.limit_length(max_speed)

	if sprite_2d.flip_h:
		sprite_2d.rotation = Vector2.LEFT.angle_to(octopus.velocity)
	else:
		sprite_2d.rotation = Vector2.RIGHT.angle_to(octopus.velocity)

	octopus.move_and_slide()
