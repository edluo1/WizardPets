extends Node

class_name Item

enum ItemType {
	PLACEABLE = 1,
	THROWABLE = 2,
	CONSUMABLE = 4
}

@export var item_name: String = ""
@export var placeable: bool = true
@export var throwable: bool = false
@export var base_item_type: ItemType

var state_index: int = 0;
@onready var itemSprite = $ItemSprite
@export var item_state_sprites: Array[Texture2D] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Call when item (like food) is eaten
func on_item_consume():
	state_index += 1
	if state_index >= len(item_state_sprites):
		on_item_finish()
	else:
		itemSprite.texture = item_state_sprites[state_index]

# Call when the item is fully consumed.
func on_item_finish():
	queue_free()
