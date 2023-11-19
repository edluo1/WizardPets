extends Node

@export var musicTrack: int

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.playMusic(musicTrack)
