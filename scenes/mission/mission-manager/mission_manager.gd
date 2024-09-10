extends Node


@export_range(1, 10, 1, "or_greater") var max_items: int = 5
@export var item_scene: PackedScene
@export var item_datas: Array[MissionItemData]
@export var spawn_area: Rect2

@onready var spawn_timer: Timer = $SpawnTimer as Timer
@onready var items: Node = $Items


func spawn_item() -> void:
	var item: MissionItem = item_scene.instantiate() as MissionItem
	item.data = item_datas.pick_random()
	item.global_position = random_point_inside_area()
	items.add_child(item)


func random_point_inside_area() -> Vector2:
	var x: float = spawn_area.size.x * randf()
	var y: float = spawn_area.size.y * randf()

	return spawn_area.position + Vector2(x, y)


func _on_spawn_timer_timeout() -> void:
	if items.get_child_count() >= max_items:
		return

	spawn_item()
