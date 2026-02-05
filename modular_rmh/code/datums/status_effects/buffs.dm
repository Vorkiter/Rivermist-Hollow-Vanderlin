/datum/status_effect/darkling_darkly
	id = "Darkling"
	alert_type =  /atom/movable/screen/alert/status_effect/darkling_darkly
	effectedstats = list(STATKEY_PER = 1)
	duration = 5 SECONDS

/atom/movable/screen/alert/status_effect/darkling_darkly
	name = "Darkling"
	desc = "You are at home in the dark. Unbothered."
	icon_state = "stressg"

//GIANT SHAPE

/datum/status_effect/buff/giant_shape
	id = "giant_shape"
	alert_type = /atom/movable/screen/alert/status_effect/buff/trollshape
	effectedstats = list(STATKEY_STR = 4, STATKEY_END = 2, STATKEY_SPD = -2, STATKEY_INT = -4)
	duration = 3 MINUTES

/atom/movable/screen/alert/status_effect/buff/giant_shape
	name = "Giant Shape"
	desc = span_nicegreen("I AM STRONG! MY ENEMIES WILL DIE!")
	icon_state = "trollshape"
/datum/status_effect/buff/giant_shape/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/human/C = owner
		C.resize = 1.2
		C.update_transform()
		C.RemoveElement(/datum/element/footstep, C.footstep_type, 1, -6)
		C.AddElement(/datum/element/footstep, FOOTSTEP_MOB_HEAVY, 1, -2)

/datum/status_effect/buff/giant_shape/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/human/C = owner
		playsound(C, 'sound/gore/flesh_eat_03.ogg', 100, TRUE)
		to_chat(C, span_warning("My body shrinking back."))
		C.apply_status_effect(/datum/status_effect/debuff/barbfalter)
		C.resize = (1/1.2)
		C.update_transform()
		C.RemoveElement(/datum/element/footstep, FOOTSTEP_MOB_HEAVY, 1, -2)
		C.AddElement(/datum/element/footstep, C.footstep_type, 1, -6)
