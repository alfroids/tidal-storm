extends State


@export var move_state: State
@export var dash_state: State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer" as AnimationPlayer
@onready var tutorial_timer: Timer = $TutorialTimer as Timer
@onready var tutorial: Sprite2D = $"../../Tutorial" as Sprite2D


## Called when this State is being activated.
func enter(_msg: Dictionary = {}) -> void:
	var tween: Tween = create_tween()
	tween.tween_property($"../../Sprite2D", ^"rotation", 0.0, 0.1)
	animation_player.play("idle")
	tutorial.visible = false
	tutorial_timer.start()


## Called when this State is being deactivated.
func exit() -> void:
	tutorial.visible = false
	tutorial_timer.stop()


## Intended to handle input events from its [class StateMachine].
func handle_input(_event: InputEvent) -> void:
	pass


## Intended to handle idle processes from its [class StateMachine].
func update(_delta: float) -> void:
	pass


## Intended to handle physics processes from its [class StateMachine].
func physics_update(_delta: float) -> void:
	var move_x: float = Input.get_action_strength(&"move_right") - Input.get_action_strength(&"move_left")
	var move_y: float = Input.get_action_strength(&"move_down") - Input.get_action_strength(&"move_up")
	var move_dir: Vector2 = Vector2(move_x, move_y).normalized()

	if Input.is_action_just_pressed(&"dash"):
		change_state(dash_state, {"direction": move_dir})
		return

	if move_dir:
		change_state(move_state)
		return


func _on_tutorial_timer_timeout() -> void:
	tutorial.visible = true
