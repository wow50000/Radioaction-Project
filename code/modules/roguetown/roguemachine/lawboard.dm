/obj/structure/roguemachine/lawboard
	name = "Law Board"
	desc = "A board that displays the laws of the land. Behave, and you may never be introduced to them."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "mailspecial-get"
	density = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	pixel_y = 32
	flags_1 = HEAR_1
	anchored = TRUE
	var/next_decree = 0
	var/listening = TRUE
	var/speaking = TRUE
	var/dictating = FALSE
	var/lawboard_number
	var/obj/structure/roguemachine/lawboard/calling = null
	var/obj/structure/roguemachine/lawboard/called_by = null

/obj/structure/roguemachine/lawboard/examine(mob/user)
	. = ..()
	if(lawboard_number)
		. += "Its designation is #[lawboard_number]."
	if(user.loc == loc)
		. += "<b>THE LAWS OF THE LAND:</b>"
		if(!length(GLOB.laws_of_the_land))
			. += span_danger("The land has no laws! <b>We are doomed!</b>")
			return
		if(!user.is_literate())
			. += span_warning("Uhhh... I can't read them...")
			return
		for(var/i in 1 to length(GLOB.laws_of_the_land))
			. += span_small("[i]. [GLOB.laws_of_the_land[i]]")
