/obj/item/clothing/undershirt
	name = "undershirt"
	desc = "Something to cover yourself with."
	icon = 'modular_rmh/icons/clothing/underwear.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/underwear.dmi'
	icon_state = "undershirt"
	item_state = "undershirt"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	salvage_result = /obj/item/natural/cloth
	slot_flags = ITEM_SLOT_UNDERSHIRT
	flags_inv = HIDECROTCH | HIDEBOOB | HIDEBELLY

/obj/item/clothing/undershirt/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.undershirt)
			if(!get_location_accessible(H, BODY_ZONE_CHEST))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, target = H))
				H.equip_to_slot_if_possible(src, ITEM_SLOT_UNDERSHIRT, disable_warning = TRUE)

/obj/item/clothing/undershirt/leotard
	name = "leotard"
	icon_state = "leotard"
	item_state = "leotard"
	gendered = TRUE
	boob_sized = TRUE

/obj/item/clothing/undershirt/athletic_leotard
	name = "athletic leotard"
	icon_state = "athletic_leotard"
	item_state = "athletic_leotard"
	gendered = TRUE

/datum/repeatable_crafting_recipe/sewing/leotard
	name = "leotard"
	output = /obj/item/clothing/undershirt/leotard
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/athletic_leotard
	name = "athletic leotard"
	output = /obj/item/clothing/undershirt/athletic_leotard
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
