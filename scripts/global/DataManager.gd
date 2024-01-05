##to reference this code invoke the DataMgr object

extends Node

var has_required_pet = false
var given_required_pet = false

##Saved variables
@export var heldThing: Res.ID = Res.ID.empty
@export var heldPet: PetData
@export var bubblePets: Array[PetData]
@export var petInventory: Array[PetData]
@export var dayNum: int = 0
@export var money: int = 0
@export var timeOfDay: int = 0
@export var currentScene: String = "Shop"

func putPetInBubble():
	if bubblePets.size() < 3:
		bubblePets.append(bubblePets[bubblePets.size()])
		for n in range(bubblePets.size() - 1, 0, -1):
			bubblePets[n + 1] = bubblePets[n]
		bubblePets[0] = heldPet
		heldPet = null

func storeHeld():
	if heldThing > Res.ID.empty && heldThing < Res.ID.item:
		petInventory.append(heldPet)
		heldThing = Res.ID.empty
		heldPet = null
	for pet in bubblePets:
		petInventory.append(pet)
	bubblePets.clear()

func saveData():
	var ayy = "lmao"

func loadData():
	var ayy = "lmao"
