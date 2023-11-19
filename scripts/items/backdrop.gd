extends Node3D

@export var isFloating = false

func _ready():
	if isFloating:
		$Sprite_Base/AnimationPlayer.play("Float")
		$Sprite_Base/AnimationPlayer.advance(randf_range(0, 2))
