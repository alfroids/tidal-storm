extends State


const DURATION: int = 15

@export_range(100.0, 2000.0, 50.0, "or_greater", "suffix:px/s") var dash_speed: float = 800.0
@export var move_state: State

@onready var octopus: Octopus = owner as Octopus
@onready var direction: Vector2
@onready var duration_count: int


## Called when this State is being activated.
func enter(msg: Dictionary = {}) -> void:
	var sprite_2d: Sprite2D = $"../../Sprite2D" as Sprite2D

	if msg.has("direction"):
		direction = msg["direction"]

	if not direction:
		if sprite_2d.flip_h:
			direction = Vector2.LEFT
		else:
			direction = Vector2.RIGHT

	if sprite_2d.flip_h:
		sprite_2d.rotation = Vector2.LEFT.angle_to(direction)
	else:
		sprite_2d.rotation = Vector2.RIGHT.angle_to(direction)

	duration_count = 0


## Called when this State is being deactivated.
func exit() -> void:
	direction = Vector2.ZERO


## Intended to handle input events from its [class StateMachine].
func handle_input(_event: InputEvent) -> void:
	pass


## Intended to handle idle processes from its [class StateMachine].
func update(_delta: float) -> void:
	pass


## Intended to handle physics processes from its [class StateMachine].
func physics_update(_delta: float) -> void:
	octopus.velocity = dash_speed * direction
	octopus.move_and_slide()

	duration_count += 1
	if duration_count >= DURATION:
		change_state(move_state)
		return
