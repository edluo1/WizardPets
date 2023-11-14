class_name BubbleSprite

extends Node3D

@export var target: Node3D
@export var tether: float
@export var maxSpeed: float

@onready var creatureSprite = $SpriteHolder/SpriteCreature

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Float")
	$AnimationPlayer.seek(randf_range(0.0, 2.0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("Float")
	var direction = target.global_position - global_position
	if direction.length_squared() > tether * tether:
		direction -= direction.normalized() * tether
		if direction.length_squared() > maxSpeed * maxSpeed * delta * delta:
			global_position += direction.normalized() * maxSpeed * delta
		else:
			global_position += direction

func SetContents(pet: Res.ID):
	visible = false
	if pet != Res.ID.empty:
		visible = true
		creatureSprite.play(Res.ID.keys()[pet])
