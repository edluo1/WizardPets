class_name SearchManager
extends Node

var FoundPlaceables = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	findByClass(get_tree().root, Placeable, FoundPlaceables)

static func findByClass(node: Node, className, result: Array = [null]):
	var oneResult = result == [null]
	var cls = node.get_class()
	if node is className:
		if oneResult:
			return node
		result.push_back(node)
	for child in node.get_children():
		var find = findByClass(child, className, result)
		if oneResult && find != null:
			return find
	if oneResult:
		return null
