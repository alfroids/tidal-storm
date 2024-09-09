extends State


## Called when this State is being activated.
func enter(_msg: Dictionary = {}) -> void:
	pass


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
func physics_update(_delta: float) -> void:
	pass
