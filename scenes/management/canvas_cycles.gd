extends Node2D

@export var _canvas_modulate: CanvasModulate
@export var _anim: AnimationPlayer

func _ready() -> void:
	_canvas_modulate.color = Color("#6f8695") # initial Canvas color
	CycleManager.cycle_started.connect(_canvas_change) # aqui eu pego o sinal emitido pelo autoload?


# Aqui, de acordo com o que foi emitido, dá pra mudar a cor do canvas
# mas nao ta funcionado
func _canvas_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		_anim.play("fade_in")
	elif phase == CycleManager.PHASE.STORM:
		_anim.play("fade_out")
