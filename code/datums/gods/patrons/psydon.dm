/datum/patron/psydon
	name = "Psydon"
	domain = "The Original God"
	desc = "The first True God, Psydon is the creator of all things. He is believed dead by the Church of the Successors."
	worshippers = "Heretics, Inquisitors, and re-emerging believers"
	associated_faith = /datum/faith/psydon
	mob_traits = list(TRAIT_ANTIMAGIC, TRAIT_PSYDONITE)
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive
	t4 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"THERE IS ONLY ONE GOD!",
		"THE SUCCESSORS ARE FALSE GODS!",
		"PSYDON LIVES!",
	)
