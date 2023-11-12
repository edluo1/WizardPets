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
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/test.dialogue"), "start")
		at_order_counter = false
