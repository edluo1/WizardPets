extends CharacterBody3D

@onready var animationPlayer = $Sprite_Base/AnimationPlayer
@onready var wizardSprite = $Sprite_Base/SpriteHolder/WizardSprite
var northbound = false
var eastbound = true
@export var hasBackpack: bool
@export var SPEED = 2.5
@export var bubbles: Array[BubbleSprite]

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
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
