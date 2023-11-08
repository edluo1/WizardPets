extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var animationPlayer = $Sprite_Base/AnimationPlayer
@onready var wizardSprite = $Sprite_Base/SpriteHolder/WizardSprite
var northbound = false
var eastbound = true

func _ready():
	print("wizard loaded")

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
	wizardSprite.play(sprite)
	
	move_and_slide()
