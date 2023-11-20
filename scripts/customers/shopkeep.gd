extends Node3D

var intro_dialogue: bool = false
@onready var wizard = $"../Wizard"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var distance = position.distance_to(wizard.position)
	if !intro_dialogue and distance < 1.0:
		var balloon = load("res://scenes/ui/balloon.tscn").instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://dialogue/day2.dialogue"), "start")
		intro_dialogue = true

