extends Node

class_name ItemInventory

class Item:  
	var name = ""
	var quantity = 0

var max_capacity = 50

var itemList = [
	Item { name: "TestItem", quantity: 10 }
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
