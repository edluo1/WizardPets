extends Object
# Should be the base class for all pets.
class_name PetData
@export var ID: Res.ID = Res.ID.empty
@export var health: int = 100
@export var strength: int = 10
@export var kindness: int = 10
@export var cuteness: int = 10
@export var mood: int = 50

func feed_strength_food(value: int) -> void:
	strength += value

func feed_health_food(value: int) -> void:
	kindness += value

func feed_cute_food(value: int) -> void:
	cuteness += value

func adjust_mood(value: int) -> void:
	mood += value
