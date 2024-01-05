class_name WizardWalk
extends CharacterBody3D

@onready var animationPlayer = $Sprite_Base/AnimationPlayer
@onready var wizardSprite = $Sprite_Base/SpriteHolder/WizardSprite
@onready var itemPlacer = $ItemPlacer
var northbound = false
var eastbound = true
@export var hasBackpack: bool
@export var SPEED = 2.5
@export var COLLECT_RADIUS = 0.5
@export var bubbles: Array[BubbleSprite]
var moving: bool
var placeVec: Vector3 = Vector3(1.0, 0.0, 0.0)

func _ready():
	add_to_group("wizard")

func _physics_process(delta):
	
	for i in bubbles.size():
		if _DataMgr.bubblePets.size() > i && _DataMgr.bubblePets[i].ID != Res.ID.empty:
			bubbles[i].SetContents(_DataMgr.bubblePets[i].ID)
		else:
			bubbles[i].SetContents(Res.ID.empty)
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		moving = true
		animationPlayer.play("Walk")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		placeVec = direction * 1.0
		if direction.z > -0.15:
			northbound = false
		elif direction.z < -0.2:
			northbound = true
		if direction.x > 0.2:
			eastbound = true
		elif direction.x < -0.2:
			eastbound = false
	else:
		moving = false
		animationPlayer.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	var sprite = "";
	if northbound:
		sprite += "N"
	else:
		sprite += "S"
	if eastbound:
		sprite += "E"
	else:
		sprite += "W"
	if hasBackpack:
		sprite += "_BP"
	wizardSprite.play(sprite)
	
	move_and_slide()
	
func _input(event):
	#if event.is_action_pressed("ui_select") and itemPlacer.item_to_place != null:
	#	itemPlacer._place_item()
	if event.is_action_pressed("ui_select"):
		if _DataMgr.heldThing != Res.ID.empty:
			if _DataMgr.heldThing < Res.ID.item && _DataMgr.heldPet != null:
				#release a pet to flee
				var scene = load("res://scenes/pets/pet_walk.tscn")
				var petWalk = scene.instantiate() as PetWalk
				petWalk.data = data
				petWalk.anchorx = global_position.x + placeVec.x
				petWalk.anchorz = global_position.z + placeVec.z
				petWalk.global_position = global_position + placeVec
				petWalk.state = PetWalk.S.fleeing
				get_parent_node_3d().add_child(petWalk)
			elif _DataMgr.heldThing > Res.ID.item:
				_DataMgr.heldPet = null
				#deploy item
				var scene = load("res://scenes/items/PlaceableItem.tscn")
				var item = scene.instantiate() as Placeable
				item.placeable_item = Item.new()
				item.placeable_item.ID = _DataMgr.heldThing
				item.global_position = global_position + placeVec
				get_parent_node_3d().add_child(item)
		else:
			#pickup logic
			#PLAN: have an item selected at all times, when 'pickup' fires grab that. Have hovering interaction icon move to desired item. Traps need to be cleaned up.
	elif event.is_action_pressed("ui_stow"):
		if _DataMgr.bubblePets.size() < 3:
			_DataMgr.putPetInBubble()



func _on_inventory_item_selected(item):
	_handle_item_selection(item)
	
func _handle_item_selection(item: Item) -> void:
	if item == null:
		return
	
	if item.placeable:
		print("item selected for placement")
		itemPlacer.item_to_place = item
	else:
		itemPlacer.item_to_place = null
