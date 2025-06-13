/datum/subclass/towndoctor
	name = "Town Doctor"
	tutorial = "You are a freelance physician, taking jobs patching thos up when you can for whatever they can or are willing to pay. its thankless and most of the time it ends up being for free with you swearing to yourself 'next one will appreciate it'"
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/towner/doctor
	category_tags = list(CTAG_SLAVE)
	traits_applied = list(TRAIT_EMPATH, TRAIT_NOSTINK)
	maximum_possible_slots = 1
	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/towner/doctor/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/spectacles
	neck = /obj/item/clothing/neck/roguetown/collar/leather/cursed
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	shoes = null
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/storage/fancy/skit = 1, /obj/item/storage/fancy/ifak = 1, /obj/item/reagent_containers/glass/alembic = 1, /obj/item/key/lowdoctor = 1, /obj/item/thermometer = 1, )
	armor = null
	shirt = null
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk


	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		if(H.age == AGE_MIDDLEAGED)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("fortune", 2)
		H.mind.AddSpell(new SPELL_DIAGNOSE_SECULAR)
