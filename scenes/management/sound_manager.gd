extends Node

@export var _calm_music: AudioStreamPlayer2D
@export var _storm_music: AudioStreamPlayer2D
@export var _rain_and_thunder: AudioStreamPlayer2D

var _first_storm_play = false

func _ready() -> void:
	_calm_music.play()
	_storm_music.volume_db = -10
	CycleManager.cycle_started.connect(_music_change) 

func _music_change(phase: CycleManager.PHASE) -> void:
	if phase == CycleManager.PHASE.CALM:
		var tween = get_tree().create_tween()
		tween.tween_property(_calm_music, "volume_db", 0, 0.5)
		tween.tween_property(_storm_music, "volume_db", -10, 0.5)
		
		_calm_music.stream_paused = false
		_storm_music.stream_paused = true
		_rain_and_thunder.stream_paused = true
		
	elif phase == CycleManager.PHASE.STORM:
		if _first_storm_play == false:
			_storm_music.play()
			_rain_and_thunder.play()
			_first_storm_play = true
			
		var tween = get_tree().create_tween()
		tween.tween_property(_calm_music, "volume_db", -10, 0.5)
		tween.tween_property(_storm_music, "volume_db", 0, 0.5)
		
		_calm_music.stream_paused = true
		_storm_music.stream_paused = false
		_rain_and_thunder.stream_paused = false
