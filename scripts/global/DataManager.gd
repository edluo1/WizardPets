##to reference this code invoke the DataMgr object

extends Node

var has_required_pet = false
var given_required_pet = false

##pet storage
var heldPet: PetData
var bubblePets: Array[PetData]
var petInventory: Array[PetData]

func storeHeld():
	petInventory.append(heldPet)
	for pets in bubblePets:
		petInventory.append(heldPet)

