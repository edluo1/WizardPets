class_name PetWalk
extends CharacterBody3D

var data: PetData

const SPEED = 5.0
const WAIT_TIME = 3.0
const JUMP_HEIGHT = 2.0
const FLEE_LIMIT = 1.0

enum S
{
	waiting,
	noise,
	moving,
	alerted,
	eating,
	trapped,
	fleeing
}
@export var holdingPen: bool = false
var MOVE_RADIUS = 4.0
var CAUTION_RADIUS = 4.0
var BAIT_RADIUS = 4.0
var state = S.waiting
var anchorx = 0.0
var anchorz = 0.0
var countdown = WAIT_TIME
var probMove = 1
var probNoise = 1
var initState = false
var startPos:Vector3
var endPos:Vector3
var alertBuildup:float = 0
var disappear = false
var baited = false

func _ready():
	var resource = "res://assets/audio/creatures/"+Res.ID.find_key(data.ID)+".wav"
	var cry = load("res://assets/audio/creatures/"+Res.ID.find_key(data.ID)+".wav")
	$AudioStreamPlayer3D.stream = cry

func _process(delta):
	var wizard = get_tree().get_nodes_in_group("wizard")[0]
	if holdingPen:
		MOVE_RADIUS = 0.5
		#TODO: if menu is open all state machine traffic other than feeding is interrupted
		#if menuOpen && state != S.eating:
		#	return
	match state:
		S.waiting:
			countdown -= delta
			if !holdingPen:
				if global_position.distance_squared_to(wizard.global_position) < CAUTION_RADIUS * CAUTION_RADIUS && wizard.moving && data.reaction != PetData.ReactionStyle.passive:
					state = S.alerted
					alertBuildup = delta
					return
				else:
					var baits = get_tree().get_nodes_in_group("Placeable")
			if countdown <= 0:
				initState = true
				if (randi() % (probMove + probNoise)) - probMove > 0:
					state = S.noise
					probNoise = 1
					probMove += 2
				else:
					state = S.moving
					probNoise += 1
					probMove = 1
		S.noise:
			if initState:
				initState = false
				countdown = 2.0
				$AudioStreamPlayer3D.play()
			countdown -= delta
			if countdown <= 0:
				countdown = WAIT_TIME
				state = S.waiting
		S.moving:
			if initState:
				initState = false
				startPos = global_position
				var r = MOVE_RADIUS * sqrt(randf_range(0.0, 1.0))
				var theta = randf_range(0.0, 1.0) * 2 * PI
				endPos = Vector3(anchorx + r * cos(theta), 0, anchorz + r * sin(theta))
				$Sprite_Base/SpriteHolder/PetSprite.flip_h = endPos.x > startPos.x
				countdown = 1.0
			countdown -= delta
			calculateMotion(1.0 - countdown)
			if countdown <= 0:
				global_position = endPos
				countdown = WAIT_TIME
				if baited:
					baited = false
					var placeables = get_tree().get_nodes_in_group("pLaceable")
					for item in placeables:
						var dist:Vector3 = global_position - item.global_position
						if dist.length_squared() < 0.2:
							match (item as Placeable).placeable_item.item_name:
								"Lettuce":
									pass
								"Meat":
									pass
								"Honey":
									pass
								"Pet Trap":
									pass
							break
				else:
					state = S.waiting
					if disappear:
						queue_free()
						for child in get_children():
							child.queue_free()
		S.eating:
			countdown -= delta
			if countdown <= 0:
				state = S.waiting
		S.alerted:
			if global_position.distance_squared_to(wizard.global_position) < CAUTION_RADIUS * CAUTION_RADIUS && wizard.moving && data.reaction != PetData.ReactionStyle.passive:
				alertBuildup += delta
			else:
				alertBuildup -= delta / 2
			var max_alert = 0.5 if data.reaction == data.ReactionStyle.skittish else 2.0
			if alertBuildup > max_alert:
				state = S.fleeing
			elif alertBuildup < 0:
				state = S.waiting
		S.fleeing:
			disappear = true
			state = S.moving
			startPos = global_position
			endPos = (global_position - wizard.global_position) * 30
			countdown = 1.0
			$AudioStreamPlayer3D.play()
			
func feedPet(foodType:Res.ID):
	data.adjust_mood(10)
	state = S.eating
	countdown = 4.2
	$Sprite_Base/SpriteHolder/FoodSprite.play(Res.ID.find_key(foodType))

func calculateMotion(progress:float):
	if data.movement == PetData.MoveStyle.bounce:
		global_position.x = startPos.x + (endPos.x - startPos.x) * progress
		global_position.z = startPos.z + (endPos.z - startPos.z) * progress
		global_position.y = -4.0 * JUMP_HEIGHT * progress * progress + 4.0 * progress
	else:
		global_position.x = startPos.x + (endPos.x - startPos.x) * (-1 * progress * progress + 2 * progress)
		global_position.z = startPos.z + (endPos.z - startPos.z) * (-1 * progress * progress + 2 * progress)
		global_position.y = 0
