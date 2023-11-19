extends Node3D

@export var tutorial_done: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !tutorial_done:
		var balloon = load("res://scenes/ui/balloon.tscn").instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://dialogue/extremely_basic_tutorial.dialogue"), "start")
		tutorial_done = true

func _on_end_day_clickable_selected(objectName):
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/end_day.tscn")

func _on_work_books_clickable_selected(objectName):
	pass # Replace with function body.

func _on_teleport_door_clickable_selected(objectName):
	get_tree().change_scene_to_file("res://scenes/ui/scene_menu.tscn")

func _on_pets_door_clickable_selected(objectName):
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/pets.tscn")
