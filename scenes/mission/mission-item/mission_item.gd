class_name MissionItem
extends Area2D


@export var data: MissionItemData


func _ready() -> void:
	if data and data.texture:
		($Sprite2D as Sprite2D).texture = data.texture


func _on_body_entered(_body: Node2D) -> void:
	CycleManager.delay_cycle_timer(data.delay_time)
	queue_free()
