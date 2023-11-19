##to reference this code invoke the DataMgr object

extends Node

var has_required_pet = false
var given_required_pet = false

##pet storage
var heldPet: PetData
var bubblePets: Array[PetData]
var petInventory: Array[PetData]

func putPetInBubble():
	if bubblePets.size() < 3:
		bubblePets.append(bubblePets[bubblePets.size()])
		for n in range(bubblePets.size() - 1, 0, -1):
			bubblePets[n + 1] = bubblePets[n]
		bubblePets[0] = heldPet
		heldPet = null

func storeHeld():
	petInventory.append(heldPet)
	for pet in bubblePets:
		petInventory.append(pet)
	heldPet = null
	bubblePets.clear()

