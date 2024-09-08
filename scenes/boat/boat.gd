extends Sprite2D


@export var hook_scene: PackedScene
@export_range(0.0, 2000.0, 10.0, "or_greater", "suffix:px") var max_depth: float = 1000.0

@onready var hook_spawn: Marker2D = $HookSpawn as Marker2D


func _ready() -> void:
	launch_hook()


func launch_hook() -> void:
	var hook: Hook = hook_scene.instantiate() as Hook
	hook.target_depth = max_depth * randf()
	hook.pulled.connect(launch_hook)
	hook_spawn.add_child(hook)
