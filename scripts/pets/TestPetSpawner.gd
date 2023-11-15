extends Node3D

@export var ID:Res.ID

func _ready():
	var data = PetLibrary.create_pet(ID)
	var scene = load("res://scenes/pets/pet_walk.tscn")
	var scene_instance = scene.instantiate()
	scene_instance.set_name("test pet")
	scene_instance.data = data
	scene_instance.anchorx = global_position.x
	scene_instance.anchorz = global_position.z
	scene_instance.global_position = global_position
	add_child(scene_instance)
	print("pet spawned")
