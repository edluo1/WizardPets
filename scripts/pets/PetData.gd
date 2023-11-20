extends Object
# Should be the base class for all pets.
class_name PetData
@export var ID: Res.ID = Res.ID.empty
@export var name: String = ""
@export var health: int = 100
@export var strength: int = 10
@export var kindness: int = 10
@export var cuteness: int = 10
@export var mood: int = 50
@export var taglist: Array
@export var eatsLettuce: bool
@export var eatsMeat: bool
@export var eatsHoney: bool
enum MoveStyle{skitter, bounce, fly}
@export var movement: MoveStyle
enum ReactionStyle{skittish, cautious, passive}
@export var reaction: ReactionStyle
enum AnimationStyle{cryOnly, backnforth}
@export var animation: AnimationStyle
@export var eatX: int = 0
@export var eatY: int = 0
var fedToday = false

func feed_strength_food(value: int) -> void:
	strength += value

func feed_health_food(value: int) -> void:
	kindness += value

func feed_cute_food(value: int) -> void:
	cuteness += value

func adjust_mood(value: int) -> void:
	mood += value
