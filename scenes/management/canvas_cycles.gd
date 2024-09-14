extends Node2D

@export var _canvas_modulate: CanvasModulate
@export var _anim: AnimationPlayer

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("#6f8695"))
	_canvas_modulate.color = Color("#6f8695") 
	CycleManager.cycle_started.connect(_canvas_change) 

func _canvas_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		RenderingServer.set_default_clear_color(Color("#6f8695"))
		_anim.play("fade_in")
	elif phase == CycleManager.PHASE.STORM:
		RenderingServer.set_default_clear_color(Color("#34252f"))
		_anim.play("fade_out")
