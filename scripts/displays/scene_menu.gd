extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_forest_pressed():
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/World_Dream.tscn")

func _on_desert_pressed():
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/World_Dream.tscn")

func _on_underwater_pressed():
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/World_Dream.tscn")

func _on_dream_pressed():
	get_tree().change_scene_to_file("res://scenes/game_maps/walkaround/World_Dream.tscn")
