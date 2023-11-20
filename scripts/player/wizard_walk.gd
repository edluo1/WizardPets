class_name WizardWalk
extends CharacterBody3D

@onready var animationPlayer = $Sprite_Base/AnimationPlayer
@onready var wizardSprite = $Sprite_Base/SpriteHolder/WizardSprite
@onready var itemPlacer = $ItemPlacer
var northbound = false
var eastbound = true
@export var hasBackpack: bool
@export var SPEED = 2.5
@export var bubbles: Array[BubbleSprite]
var moving: bool

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
	if event.is_action_pressed("ui_select") and itemPlacer.item_to_place != null:
		itemPlacer._place_item()

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
