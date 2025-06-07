// Slaver Tab - Top Bar

/datum/status_effect/slaver_scrying
	id = "slaver_scrying"
	duration = 300 // 30 seconds
	alert_type = null
	var/mob/living/carbon/human/scrying_target = null

/datum/status_effect/slaver_scrying/on_apply()
	. = ..()
	if(!ishuman(owner))
		return FALSE
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(stop_scrying))
	return TRUE

/datum/status_effect/slaver_scrying/on_remove()
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	scrying_target = null
	// Return client key to owner and delete ghost if exists
	if (owner && owner.client && isobserver(owner.client.mob))
		var/mob/dead/observer/S = owner.client.mob
		if (istype(S, /mob/dead/observer/screye))
			owner.client.mob.key = null // Dissociate client from ghost first
			owner.client.mob.client = null // Dissociate client from ghost
			owner.client.mob = owner // Re-attach client to original mob
			owner.key = owner.client.key // Return key to original mob
			qdel(S) // Delete the ghost
			owner.client.eye = owner // Ensure eye is on the mob
	return ..()

/datum/status_effect/slaver_scrying/proc/stop_scrying(atom/movable/mover, atom/oldloc, direction)
	SIGNAL_HANDLER
	qdel(src)

/mob/living/carbon/human/verb/shock_slaves_verb()
	set name = "Shock Slaves"
	set category = "Slaver"
	set desc = "Shock all visible slaves."
	set hidden = FALSE // Make visible in the tab
	if(!HAS_TRAIT(usr, TRAIT_SLAVER))
		return // Hide if the user doesn't have the trait dynamically

	var/list/slaves_in_view = list()
	for(var/mob/living/carbon/human/H in view(usr))
		slaves_in_view += H

	var/list/slaves_to_shock = list()
	for(var/mob/living/carbon/human/S in slaves_in_view)
		if(HAS_TRAIT(S, TRAIT_SLAVE))
			slaves_to_shock += S

	if(!length(slaves_to_shock))
		to_chat(usr, span_warning("No slaves in view to shock!"))
		return
	for(var/mob/living/carbon/human/H in slaves_to_shock)
		H.electrocute_act(100, usr, 1, SHOCK_ILLUSION)
		to_chat(H, span_danger("Your cursed collar shocks you!"))
	to_chat(usr, span_notice("You have shocked all visible slaves!"))

/mob/living/carbon/human/verb/scry_slave_verb()
	set name = "Scry Slave"
	set category = "Slaver"
	set desc = "Scry on a slave. Lasts until you move."
	set hidden = FALSE // Make visible in the tab
	if(!HAS_TRAIT(usr, TRAIT_SLAVER))
		return // Hide if the user doesn't have the trait dynamically

	var/list/slaves = list()
	for(var/mob/living/carbon/human/H in GLOB.mob_list)
		if(HAS_TRAIT(H, TRAIT_SLAVE))
			slaves["[H.name] ([H])"] = H
	if(!length(slaves))
		to_chat(usr, span_warning("No slaves found to scry!"))
		return
	var/choice = input(usr, "Choose a slave to scry on", "Scry Slave") as null|anything in slaves
	if(!choice)
		return
	var/mob/living/carbon/human/target = slaves[choice]
	if(!target || !istype(target))
		return
	var/datum/status_effect/slaver_scrying/SC = src.apply_status_effect(/datum/status_effect/slaver_scrying)
	SC.scrying_target = target
	to_chat(usr, span_notice("You begin scrying on [target.name]. (This will last until you move.)"))

	// Initiate scrying view
	var/mob/dead/observer/S = usr.scry_ghost()
	if(S)
		S.ManualFollow(target)
