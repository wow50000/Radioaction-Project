/datum/job/roguetown/courier
	title = "Courier"
	flag = COURIER
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_TOLERATED_UP
	allowed_ages = list(AGE_ADULT)

	tutorial = "Unusually nimble and highly literate, you are a courier. The lifeblood of communication in the realm, your job is to carry information, parcels and news throughout the lands."

	outfit = /datum/outfit/job/roguetown/courier
	display_order = JDO_COURIER
	give_bank_account = TRUE
	min_pq = 1
	max_pq = null

/datum/outfit/job/roguetown/courier/pre_equip(mob/living/carbon/human/H)
	..()
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltl = /obj/item/storage/keyring/shophand
	backr = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		cloak = /obj/item/clothing/cloak/

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)

	H.change_stat("strength", -1)
	H.change_stat("constituion", -3)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
