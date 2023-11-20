class_name Placeable extends Node3D
const SHADER_MATERIAL = preload("res://assets/items/PlaceableShaderMaterial.tres")
const SHADER_PARAM_PREVIEW = "PREVIEW"
const SHADER_PARAM_PLACEABLE = "PLACEABLE"

@onready var sprite3d = $SpriteHolder/AnimatedSprite3D as AnimatedSprite3D
@export var placeable_item = Item
var previewing: bool = false:
	get:
		return previewing
	set(new_value):
		previewing = new_value
		_update_shader()

var can_place: bool = true:
	get:
		return can_place
	set(new_value):
		can_place = new_value
		_update_shader()

# Called when the node enters the scene tree for the first time.
func _ready():
	#_setup_shader()
	add_to_group("placeable")
	match placeable_item.item_name:
		"Lettuce":
			setImage("lettuce")
		"Meat":
			setImage("meat")
		"Honey":
			setImage("honey")
		"Pet Trap":
			setImage("trap_open")
	
func _setup_shader() -> void:
	# sprite3d.material_override = SHADER_MATERIAL.duplicate()
	_update_shader()
	
func _update_shader() -> void:
	if sprite3d.material_override == null:
		return
	
func setImage(name: String):
	sprite3d.play(name)
	
	# sprite3d.material_override.set_shader_parameter(SHADER_PARAM_PREVIEW, previewing)
	# sprite3d.material_override.set_shader_parameter(SHADER_PARAM_PLACEABLE, can_place)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#sprite3d.set_texture(placeable_item.itemSprite.texture)
	
	pass
