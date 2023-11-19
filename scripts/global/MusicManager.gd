extends Node

@export var introStreamers: Array[AudioStreamPlayer] = []
@export var musicStreamers: Array[AudioStreamPlayer] = []
var currentlyPlaying: AudioStreamPlayer
var selectedTrack: int

func _ready():
	pass

func _process(delta):
	pass

func playMusic(musicNum: int):
	return
	selectedTrack = musicNum
	if currentlyPlaying:
		var tween = get_tree().create_tween()
		tween.tween_property(currentlyPlaying, "volume_db", -80, 2.0)
		tween.tween_callback(_loadNewTrack)
	else:
		_loadNewTrack()

func _loadNewTrack():
	if currentlyPlaying:
		currentlyPlaying.stop()
		
	currentlyPlaying = introStreamers[selectedTrack]
	currentlyPlaying.play()
	await introStreamers[selectedTrack].finished
	currentlyPlaying = musicStreamers[selectedTrack]
	currentlyPlaying.play()
	
