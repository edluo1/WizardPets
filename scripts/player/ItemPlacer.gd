class_name ItemPlacer extends Node3D

@export var player: WizardWalk

var preview_instance: Placeable

var world: Node3D:
	get:
		return player.get_parent()

var item_to_place: Item:
	get:
		return item_to_place
	set(new_item):
		_clear_preview()
		item_to_place = new_item
		_create_placement_preview()

# Placement

func _create_placement_preview() -> void:
	if item_to_place == null:
		return
	
	# Create preview
	var placeable_scene = load("res://scenes/items/PlaceableItem.tscn")
	# Instantiate preview scene/sprite without collision and then addd it to the world
	preview_instance = placeable_scene.instantiate() as Placeable
	preview_instance.placeable_item = item_to_place
	print(Res.ID.keys()[preview_instance.placeable_item.ID])
	world.add_child(preview_instance)
	preview_instance.previewing = true

func _clear_preview() -> void:
	if preview_instance == null:
		return
	# Delete any preview instance versions of scenes.
	preview_instance.queue_free()

func _physics_process(delta) -> void:
	if preview_instance != null:
		var player_position = player.global_position
		var rounded_position = Vector3(player_position.x, 0, player_position.z)
		preview_instance.global_position = rounded_position
		
func _place_item() -> void:
	if preview_instance == null:
		return
	
	if !preview_instance.can_place:
		# Might make a sound here
		return
	
	print("item placed")
		
	# Remove from previewer
	preview_instance.previewing = false
	preview_instance = null
	item_to_place = null
