extends Node

@export var _calm_music: AudioStreamPlayer2D
@export var _storm_music: AudioStreamPlayer2D

func _ready() -> void:
	_calm_music.play() 
	CycleManager.cycle_started.connect(_music_change) 

func _music_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		_calm_music.play()
		_storm_music.stop()
	elif phase == CycleManager.PHASE.STORM:
		_storm_music.play()
		_calm_music.stop()
