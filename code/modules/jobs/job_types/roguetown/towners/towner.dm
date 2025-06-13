/datum/job/roguetown/towner
	title = "Slave"
	flag = VILLAGER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 75
	spawn_positions = 75
	allowed_races = RACES_VERY_SHUNNED_UP
	tutorial = "Taken from your previous life, you now serve the fortress."
	subclass_cat_rolls = list(CTAG_SLAVE = 20)
	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	banned_leprosy = FALSE
	display_order = JDO_VILLAGER
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	wanderer_examine = FALSE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 0

	var/static/list/collar_colors = list(
		"Red" = "#FF0000",
		"Blue" = "#0000FF",
		"Green" = "#00FF00",
		"Purple" = "#800080",
		"Gold" = "#FFD700",
		"Silver" = "#C0C0C0",
		"Black" = "#000000",
		"White" = "#FFFFFF"
	)

/datum/job/roguetown/towner/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		ADD_TRAIT(H, TRAIT_SLAVE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
		
		// Create a cursed collar with default color
		var/obj/item/clothing/neck/roguetown/collar/leather/cursed/collar = new()
		H.equip_to_slot_or_del(collar, SLOT_NECK)
		
		// Schedule the color selection for after the player is ready
		addtimer(CALLBACK(src, PROC_REF(select_collar_color), H), 5 SECONDS)

/datum/job/roguetown/towner/proc/select_collar_color(mob/living/carbon/human/H)
	if(!H || !istype(H))
		return
		
	var/obj/item/clothing/neck/roguetown/collar/leather/cursed/collar = H.get_item_by_slot(SLOT_NECK)
	if(!collar || !istype(collar, /obj/item/clothing/neck/roguetown/collar/leather/cursed))
		return
		
	var/color_choice = input(H, "Choose your collar color:", "Collar Color") as null|anything in collar_colors
	if(color_choice)
		collar.color = collar_colors[color_choice]
		H.update_inv_neck()
