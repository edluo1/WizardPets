extends Node

class_name Customer

var want_types = [
	{"kindness": 12},
	{"type": "thang"},
	{"type": "catbeast", "health": 112}
]

var at_order_counter = true

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if at_order_counter:
		var balloon = load("res://scenes/ui/balloon.tscn").instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://dialogue/day3.dialogue"), "start")
		at_order_counter = false
