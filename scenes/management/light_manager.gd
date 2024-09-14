extends Node

@export var _sunlight: DirectionalLight2D
@export var light_scene : PackedScene
@export var num_lights : int = 3

var lights : Array = [] 
var square_size : Vector2 = Vector2(3700, 900)

func _ready() -> void:
	CycleManager.cycle_started.connect(_orbs_visibility) 

func _orbs_visibility(phase: CycleManager.PHASE) -> void:
		if phase == CycleManager.PHASE.CALM:
			delete_lights()
			
			var tween = get_tree().create_tween()
			tween.tween_property(_sunlight, "energy", 0.5, 1)
		
		elif phase == CycleManager.PHASE.STORM:
			spawn_random_lights()
			
			var tween = get_tree().create_tween()
			tween.tween_property(_sunlight, "energy", 0.15, 1)

func spawn_random_lights():
	for i in range(num_lights):
		var light_instance = light_scene.instantiate()
		var random_x = randf() * square_size.x
		var random_y = randf() * square_size.y
		light_instance.position = Vector2(random_x, random_y)
		add_child(light_instance)
		lights.append(light_instance)  

func delete_lights():
	for light in lights:
		light.queue_free()  
	lights.clear()  
