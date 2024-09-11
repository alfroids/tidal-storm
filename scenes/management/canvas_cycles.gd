extends Node2D

@export var _canvas_modulate: CanvasModulate

func _ready():
	_canvas_modulate.color = Color("#6f8695") # initial Canvas color
	CycleManager.cycle_ended.connect(_canvas_change)

func _canvas_change(type):
	if type == "calm":
		print("vai mudar pra claro")
	elif type == "storm":
		print("vai mudar pra escuro")
	
