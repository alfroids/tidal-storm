extends Path2D


@export var hook_scene: PackedScene

@onready var spawn_location: PathFollow2D = $SpawnLocation as PathFollow2D
@onready var spawn_timer: Timer = $SpawnTimer as Timer


func _on_spawn_timer_timeout() -> void:
	spawn_location.progress_ratio = randf()

	var hook: Area2D = hook_scene.instantiate() as Area2D
	hook.global_position = spawn_location.global_position
	add_child(hook)

	spawn_timer.start(randf_range(2.0, 6.0))
