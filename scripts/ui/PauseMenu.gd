extends Control
@onready var canvas_layer = %CanvasLayer
var visible_menu: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_save_button_pressed():
	pass # Replace with function body.

func _on_load_button_pressed():
	pass # Replace with function body.

func _on_resume_button_pressed():
	visible_menu = false
	canvas_layer.visible = visible_menu

func _on_exit_button_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause_button"):
		visible_menu = !visible_menu
		canvas_layer.visible = visible_menu
