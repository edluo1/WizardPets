extends Node3D

@export var ID:Res.ID

func _ready():
	var data = PetLibrary.create_pet(ID)
	var scene = load("res://scenes/pets/pet_walk.tscn")
	var petWalk = scene.instantiate() as PetWalk
	petWalk.set_name("test pet")
	petWalk.data = data
	petWalk.anchorx = global_position.x
	petWalk.anchorz = global_position.z
	petWalk.global_position = global_position
	add_child(petWalk)
	print("pet spawned")
