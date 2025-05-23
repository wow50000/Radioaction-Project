/datum/job/roguetown/cook
	title = "Cook"
	flag = COOK
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_TOLERATED_UP
	tutorial = "Working closely with the barkeep who owns Skull Crack Inn, the cook should focus on cooking food for all the hungry mouths of Roguetown."

	outfit = /datum/outfit/job/roguetown/cook
	display_order = JDO_COOK
	give_bank_account = 8
	min_pq = -10
	max_pq = null

/datum/outfit/job/roguetown/cook/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE) //you're the cook, you can COOK with knives, get it?
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/key/tavern
	beltr = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/flint,/obj/item/natural/cloth/,/obj/item/key/nightman)
	if(H.gender == MALE)

		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		cloak = /obj/item/clothing/cloak/apron/cook
		head = /obj/item/clothing/head/roguetown/cookhat
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		H.change_stat("constitution", 2)
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		cloak = /obj/item/clothing/cloak/apron/cook
		head = /obj/item/clothing/head/roguetown/cookhat
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		H.change_stat("constitution", 2)
