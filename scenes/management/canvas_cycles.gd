extends Node2D

@export var _canvas_modulate: CanvasModulate

func _ready():
	_canvas_modulate.color = Color("#6f8695") # initial Canvas color
	CycleManager.cycle_start.connect(_canvas_change) # aqui eu pego o sinal emitido pelo autoload?


# Aqui, de acordo com o que foi emitido, dá pra mudar a cor do canvas
# mas nao ta funcionado 
func _canvas_change(type):
	if type == "calm":
		print("vai mudar pra claro")
	elif type == "storm":
		print("vai mudar pra escuro")
