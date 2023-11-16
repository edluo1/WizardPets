extends Panel

var ItemClass = preload("res://scenes/items/food/Honey.tscn")

var allItems = [preload("res://scenes/items/food/Honey.tscn"),
	preload("res://scenes/items/food/Lettuce.tscn"),
	preload("res://scenes/items/food/Meat.tscn")]
var item = null

# Called when the node enters the scene tree for the first time.
# Currently just loads in random items.
func _ready():
	if randi() % 2 == 0:
		var itemToLoad = randi() % 3
		item = allItems[itemToLoad].instantiate()
		add_child(item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func pickFromSlot():
	if item != null:
		remove_child(item)
		var inventoryNode = find_parent("Inventory")
		inventoryNode.add_child(item)
		inventoryNode.emit_signal("item_selected", item)
		item = null

func putIntoSlot(new_item):
	if new_item != null:
		item = new_item
		item.position = Vector2(0, 0)
		var inventoryNode = find_parent("Inventory")
		inventoryNode.remove_child(item)
		add_child(item)
