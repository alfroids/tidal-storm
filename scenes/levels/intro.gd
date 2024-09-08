extends Control

@export var _anim: AnimationPlayer

func _ready():
	_anim.play("proverb_fade_out")
