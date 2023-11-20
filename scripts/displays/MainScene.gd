extends Control

var intro_dialogue_done: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !intro_dialogue_done:
		var balloon = load("res://scenes/ui/balloon.tscn").instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://dialogue/intro_demo.dialogue"), "intro")
		intro_dialogue_done = true
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_maps/shop_purchase.tscn")

func _on_load_button_pressed():
	pass # Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()
