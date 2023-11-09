extends CharacterBody3D


const MAX_SPEED = 5.0
const MIN_SPEED = 0.1
const ACCEL = 3.0
@export var target: Node3D

func _ready():
	if target.name != "Camera_Target":
		target = target.find_child("Camera_Target")

func _physics_process(delta):
	var direction = target.global_position - global_position
	var speed = min(direction.length_squared(), MAX_SPEED)
	
	direction = direction.normalized()
	velocity.x = move_toward(velocity.x, direction.x * speed, ACCEL)
	velocity.y = move_toward(velocity.y, direction.y * speed, ACCEL)
	velocity.z = move_toward(velocity.z, direction.z * speed, ACCEL)

	move_and_slide()
