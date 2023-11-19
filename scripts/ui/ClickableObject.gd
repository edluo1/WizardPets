extends Node3D

@export var objectName: String

signal clickable_selected(objectName)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			print("clicked on %s" % objectName)
			emit_signal("clickable_selected", objectName)
	elif event is InputEventMouseMotion:
		print("hovered over")
