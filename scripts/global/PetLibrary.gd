extends Object
class_name PetLibrary
static func create_pet(id: Res.ID):
	var pet = PetData.new()
	pet.ID = id
	match id:
		Res.ID.fairy:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.shroom:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.bear:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.moss:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.guard:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.buggi:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.dandi:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.lizard:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.sand:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.spider:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.thang:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.shrump:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.eyes:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.jelly:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.doll:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.angel:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.plushbie:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.tea:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.sheep:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
		Res.ID.strings:
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0
			pet.eatY = 0
	return pet
