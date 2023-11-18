extends Node

@export var introStreamers: Array[AudioStreamPlayer] = []
@export var musicStreamers: Array[AudioStreamPlayer] = []
var currentlyPlaying: AudioStreamPlayer
var selectedTrack: int

func _ready():
	playMusic(0)
	
var countdown = 25.0

func _process(delta):
	var x = 5
	x += 2
	countdown -= delta
	if countdown <= 0:
		playMusic(1)
		countdown = 100000.0

func playMusic(musicNum: int):
	selectedTrack = musicNum
	if currentlyPlaying:
		var tween = get_tree().create_tween()
		tween.tween_property(currentlyPlaying, "Volume_db", -80, 3.0)
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
	
