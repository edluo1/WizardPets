extends Control

const SlotClass = preload("res://scripts/ui/Slot.gd")
@onready var inventory_slots = $InventoryUI/GridContainer
var holding_item: Item = null
var heldThing: Res.ID = Res.ID.empty

signal item_selected(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))
		
func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item: # Place held item into slot
					slot.putIntoSlot(holding_item)
					holding_item = null
				else: # Swap with new one
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
