
/* /mob/living/proc/GraggaritePower()
	for(var/mob/living/carbon/user)
		if(iscarbon(user))
			var/mob/living/carbon/carbon_user = user
			if(HAS_TRAIT(carbon_user, TRAIT_GRAGGAR_CHOSEN))
				return TRUE



	/mob/living/carbon/human/proc/enrage()
		set name = "Enrage"
		set category = "GRAGGAR"

		if(has_status_effect(/datum/status_effect/buff/enrage))
			to_chat(src, span_warning("Already active."))
			return
		apply_status_effect(/datum/status_effect/buff/enrage)
		to_chat(src, span_greentext("GRAGGAAAAAR!!!"))
		src.playsound_local(get_turf(src), 'sound/misc/vampirespell.ogg', 100, FALSE, pressure_affected = FALSE)

		/datum/status_effect/buff/enrage
			id = "enrage"
			alert_type = /atom/movable/screen/alert/status_effect/buff/enrage
			effectedstats = list("strength" = 6)
			duration = 1 MINUTES

	/atom/movable/screen/alert/status_effect/buff/enrage
		name = "Enraged"
		desc = ""
		icon_state = "bleed1" */
