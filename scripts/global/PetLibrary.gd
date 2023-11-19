extends Object
class_name PetLibrary
static func create_pet(id: Res.ID):
	var pet = PetData.new()
	pet.ID = id
	match id:
		Res.ID.fairy:
			pet.name = "Fidamy"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.132
			pet.eatY = -0.04
		Res.ID.shroom:
			pet.name = "Shroobie"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.082
			pet.eatY = -0.09
		Res.ID.bear:
			pet.name = "Owlcub"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.187
			pet.eatY = -0.14
		Res.ID.moss:
			pet.name = "little Mossin"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.097
			pet.eatY = -0.165
		Res.ID.guard:
			pet.name = "Tree guard"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = -50
		Res.ID.buggi:
			pet.name = "Ufobie"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.047
			pet.eatY = 0.03
		Res.ID.dandi:
			pet.name = "Dandibird"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.202
			pet.eatY = 0
		Res.ID.lizard:
			pet.name = "Sandskit"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = -0.048
			pet.eatY = 0.05
		Res.ID.sand:
			pet.name = "Bronze Shellin"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.067
			pet.eatY = -0.235
		Res.ID.spider:
			pet.name = "Rockspeck"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.102
			pet.eatY = -0.17
		Res.ID.thang:
			pet.name = "Thang"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = -0.028
			pet.eatY = -0.045
		Res.ID.shrump:
			pet.name = "Shecklie"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.117
			pet.eatY = -0.135
		Res.ID.eyes:
			pet.name = "Hollowish"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.132
			pet.eatY = -0.135
		Res.ID.jelly:
			pet.name = "Blubbyfloat"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.002
			pet.eatY = -0.215
		Res.ID.doll:
			pet.name = "Paratite"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.072
			pet.eatY = -0.075
		Res.ID.angel:
			pet.name = "It"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0
			pet.eatY = -50
		Res.ID.plushbie:
			pet.name = "Ectopush"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = true
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = -0.018
			pet.eatY = 0.195
		Res.ID.tea:
			pet.name = "Slimechariot"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.fly
			pet.reaction = PetData.ReactionStyle.cautious
			pet.animation = PetData.AnimationStyle.backnforth
			pet.eatX = 0.077
			pet.eatY = -0.1
		Res.ID.sheep:
			pet.name = "Dreamcotton"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = false
			pet.eatsMeat = false
			pet.eatsHoney = true
			pet.movement = PetData.MoveStyle.bounce
			pet.reaction = PetData.ReactionStyle.passive
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.077
			pet.eatY = -0.1
		Res.ID.strings:
			pet.name = "Stringed Dragon"
			pet.taglist = ["TODO"]
			pet.eatsLettuce = true
			pet.eatsMeat = false
			pet.eatsHoney = false
			pet.movement = PetData.MoveStyle.skitter
			pet.reaction = PetData.ReactionStyle.skittish
			pet.animation = PetData.AnimationStyle.cryOnly
			pet.eatX = 0.027
			pet.eatY = 0.065
	return pet
