/obj/item/earring
	name = "stud earring"
	desc = "Stylish ear ornament."
	icon = 'modular_rmh/icons/clothing/earrings.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/earrings.dmi'
	icon_state = "ear_stud"
	item_state = "ear_stud"
	w_class = WEIGHT_CLASS_TINY
	obj_flags = CAN_BE_HIT
	max_integrity = 200
	integrity_failure = 0
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	slot_flags = ITEM_SLOT_EARRING_L | ITEM_SLOT_EARRING_R

/obj/item/earring/equipped(mob/living/carbon/user, slot)
	. = ..()
	if(user.earring_l == src)
		icon_state = initial(icon_state) + "_l"
	else
		icon_state = initial(icon_state) + "_r"
	user.update_clothing()

/obj/item/earring/dropped(mob/user)
	. = ..()
	icon_state = initial(icon_state)

/obj/item/earring/glass
	name = "glass stud earring"
	color = "#00e1ff"

/obj/item/earring/wood
	name = "wood stud earring"
	color = "#824b28"

/obj/item/earring/iron
	name = "iron stud earring"
	color = "#5c5454"

/obj/item/earring/steel
	name = "steel stud earring"
	color = "#666666"

/obj/item/earring/silver
	name = "silver stud earring"
	color = "#d1e6e3"

/obj/item/earring/gold
	name = "gold stud earring"
	color = "#edd12f"

/obj/item/earring/platinum
	name = "platinum stud earring"
	color = "#9999ff"

/obj/item/earring/onyx
	name = "onyx stud earring"
	color = "#070d23"

/obj/item/earring/emerald
	name = "emerald stud earring"
	color = "#23a230"

/obj/item/earring/amber
	name = "amber stud earring"
	color = "#da5806"

/obj/item/earring/amethyst
	name = "amethyst stud earring"
	color = "#8332f9"

/obj/item/earring/ruby
	name = "ruby stud earring"
	color = "#e53232"

/obj/item/earring/sapphire
	name = "sapphire stud earring"
	color = "#228ded"

/obj/item/earring/diamond
	name = "diamond stud earring"
	color = "#00ffe1"

/obj/item/earring/dangle
	name = "dangle earring"
	icon_state = "ear_dangle"
	item_state = "ear_dangle"

/obj/item/earring/dangle/glass
	name = "glass dangle earring"
	color = "#00e1ff"

/obj/item/earring/dangle/wood
	name = "wood dangle earring"
	color = "#824b28"

/obj/item/earring/dangle/iron
	name = "iron dangle earring"
	color = "#5c5454"

/obj/item/earring/dangle/steel
	name = "steel dangle earring"
	color = "#666666"

/obj/item/earring/dangle/silver
	name = "silver dangle earring"
	color = "#d1e6e3"

/obj/item/earring/dangle/gold
	name = "gold dangle earring"
	color = "#edd12f"

/obj/item/earring/dangle/platinum
	name = "platinum dangle earring"
	color = "#9999ff"

/obj/item/earring/dangle/onyx
	name = "onyx dangle earring"
	color = "#070d23"

/obj/item/earring/dangle/emerald
	name = "emerald dangle earring"
	color = "#23a230"

/obj/item/earring/dangle/amber
	name = "amber dangle earring"
	color = "#da5806"

/obj/item/earring/dangle/amethyst
	name = "amethyst dangle earring"
	color = "#8332f9"

/obj/item/earring/dangle/ruby
	name = "ruby dangle earring"
	color = "#e53232"

/obj/item/earring/dangle/sapphire
	name = "sapphire dangle earring"
	color = "#228ded"

/obj/item/earring/dangle/diamond
	name = "diamond dangle earring"
	color = "#00ffe1"

