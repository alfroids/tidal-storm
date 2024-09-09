extends Node2D


@export var boat_scene: PackedScene

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
	boat.moved.connect(boat.throw_hook)
	boat.pulled_hook.connect(move_boat)
	add_child(boat)
	move_boat(boat)


func move_boat(boat: Boat) -> void:
	move_location.progress_ratio = randf()
	var pos: Vector2 = move_location.global_position
	boat.move_to(pos)
