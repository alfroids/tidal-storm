extends Node2D


@export var boat_scene: PackedScene
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var min_hook_depth: float = 250.0
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var max_hook_depth: float = 1000.0

@onready var spawn_locations: Array[Marker2D] = [
	$SpawnLocation1 as Marker2D,
	$SpawnLocation2 as Marker2D,
]
@onready var move_location: PathFollow2D = $MovePath/MoveLocation as PathFollow2D


func _ready() -> void:
	spawn_boat()


func spawn_boat() -> void:
	var spawn_location: Marker2D = spawn_locations.pick_random()
	var boat: Boat = boat_scene.instantiate() as Boat
	boat.global_position = spawn_location.global_position
	boat.pulled_hook.connect(move_and_throw_hook)
	add_child(boat)
	move_and_throw_hook(boat)


func move_and_throw_hook(boat: Boat) -> void:
	move_location.progress_ratio = randf()
	var pos: Vector2 = move_location.global_position
	boat.move_to(pos)
	await boat.reached_target_position
	boat.throw_hook(randf_range(min_hook_depth, max_hook_depth))
