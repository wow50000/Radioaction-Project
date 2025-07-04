/datum/subclass/cheesemaker
	name = "Cheesemaker"
	tutorial = "As a cheesemaker you work alongside the local farm, purchasing milk to make batches of your infamous cheeses and cheese-full recipes. Beware of rouses."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/towner/cheesemaker
	category_tags = list(CTAG_SLAVE)

/datum/outfit/job/roguetown/towner/cheesemaker/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	shirt = null
	armor = null
	shoes = null
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk
	head = /obj/item/clothing/head/roguetown/chef
	backl = /obj/item/storage/backpack/rogue/backpack
	neck = /obj/item/clothing/neck/roguetown/collar/leather/cursed
	beltr = /obj/item/flint
	beltl = /obj/item/rogueweapon/huntingknife
	backpack_contents = list(/obj/item/cooking/pan = 1, /obj/item/reagent_containers/food/snacks/rogue/cheddar = 1, /obj/item/reagent_containers/glass/bottle/rogue/milk = 3, /obj/item/natural/cloth = 1, /obj/item/reagent_containers/powder/salt = 4)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("perception", -1)
	H.change_stat("speed", -1)
	if(H.age == AGE_MIDDLEAGED)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
