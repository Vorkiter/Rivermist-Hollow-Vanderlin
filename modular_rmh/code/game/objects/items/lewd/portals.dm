/**************************************************************
 * PORTAL LIGHT
 **************************************************************/

obj/item/portallight
    name = "portal light"
    desc = "A softly pulsing arcane device."
    icon = 'modular_rmh/icons/obj/lewd/fleshlight.dmi'
    icon_state = "fleshlight_base"
    var/obj/item/clothing/undies/portalpanties/linked_underwear = null

/obj/item/portallight/proc/get_wearer()
    if(!linked_underwear)
        return null
    return linked_underwear.current_wearer

/obj/item/portallight/proc/is_held_by(mob/living/carbon/human/user)
    return (user.get_active_held_item() == src)

/**************************************************************
 * PORTAL PANTIES
 **************************************************************/

obj/item/clothing/undies/portalpanties
    name = "portal panties"
    desc = "Laced with unstable portal magic."
    icon = 'modular_rmh/icons/obj/lewd/fleshlight.dmi'
    icon_state = "portalpanties"
    var/obj/item/portallight/linked_light = null
    var/mob/living/carbon/human/current_wearer = null

obj/item/clothing/undies/portalpanties/equipped(mob/living/carbon/human/H, slot)
    ..()
    current_wearer = H
    if(linked_light)
        linked_light.linked_underwear = src

obj/item/clothing/undies/portalpanties/dropped(mob/living/carbon/human/H)
    ..()
    if(current_wearer)
        current_wearer = null
        if(linked_light)
            linked_light.linked_underwear = null

obj/item/clothing/undies/portalpanties/Destroy()
    if(current_wearer && linked_light)
        linked_light.linked_underwear = null
    ..()

obj/item/clothing/undies/portalpanties/attackby(obj/item/I, mob/living/carbon/human/user)
    if(!istype(I, /obj/item/portallight))
        return ..()

    var/obj/item/portallight/P = I

    if(linked_light == P)
        linked_light = null
        P.linked_underwear = null
        to_chat(user, span_notice("[P] has been successfully unlinked."))
        return

    linked_light = P
    P.linked_underwear = src
    to_chat(user, span_notice("[P] has been successfully linked."))

/**************************************************************
 * SEX ACTION: PORTAL HAND
 **************************************************************/

datum/sex_action/portal_hand
    name = "Portal Hand"
    target_priority = 50
    var/obj/item/portallight/light
    var/mob/living/carbon/human/target
    check_same_tile = FALSE

/datum/sex_action/portal_hand/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/obj/item/portallight/L = user.get_active_held_item()
    if(!istype(L, /obj/item/portallight))
        return FALSE
    var/mob/living/carbon/human/W = L.get_wearer()
    if(!W)
        return FALSE
    light = L
    target = W
    return TRUE

/datum/sex_action/portal_hand/on_start(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_warning("You slide your hand through the portal, touching [target]."))
    to_chat(target, span_love("You feel a distant touch through the portal!"))

/datum/sex_action/portal_hand/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    do_thrust_animate(user, user)
    to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] finger [target] through the portal."))
    to_chat(target, sex_session.spanify_force("[user] [sex_session.get_generic_force_adjective()] fingers you through the portal."))
    sex_session.perform_sex_action(target, user, 2, 4, 2, src)
    sex_session.handle_passive_ejaculation(target)
    SEND_SIGNAL(target, COMSIG_SEX_ADJUST_AROUSAL, 5)
    playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

/datum/sex_action/portal_hand/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target, must_flip)
    to_chat(target, span_love("You climax from the portal touch! Your body trembles with pleasure."))
    to_chat(user, span_love("[target] shudders and reacts to your touch through the portal."))
    return ORGASM_LOCATION_SELF

/datum/sex_action/portal_hand/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_notice("You withdraw your hand from the portal."))
    to_chat(target, span_notice("The distant touch fades away."))

/**************************************************************
 * SEX ACTION: PORTAL ORAL
 **************************************************************/

datum/sex_action/portal_oral
    name = "Portal Oral"
    target_priority = 70
    var/obj/item/portallight/light
    var/mob/living/carbon/human/target
    gags_user = TRUE

/datum/sex_action/portal_oral/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/obj/item/portallight/L = user.get_active_held_item()
    if(!istype(L, /obj/item/portallight))
        return FALSE
    var/mob/living/carbon/human/W = L.get_wearer()
    if(!W)
        return FALSE
    light = L
    target = W
    return TRUE

/datum/sex_action/portal_oral/on_start(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_warning("You press your mouth to the portal, reaching [target]."))
    to_chat(target, span_love("Warm sensations bloom between your legs!"))

/datum/sex_action/portal_oral/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    user.make_sucking_noise()
    to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] lick [target] through the portal."))
    to_chat(target, sex_session.spanify_force("[user] [sex_session.get_generic_force_adjective()] licks you through the portal."))
    sex_session.perform_sex_action(target, user, 2, 3, 2, src)
    sex_session.handle_passive_ejaculation(target)
    SEND_SIGNAL(target, COMSIG_SEX_ADJUST_AROUSAL, 10)

/datum/sex_action/portal_oral/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target, must_flip)
    to_chat(target, span_love("You climax from the portal oral! Your body shudders in ecstasy."))
    to_chat(user, span_love("You bring [target] to climax through the portal!"))
    return ORGASM_LOCATION_SELF

/datum/sex_action/portal_oral/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_notice("You pull back from the portal."))
    to_chat(target, span_notice("The sensations from the portal fade away."))

/**************************************************************
 * SEX ACTION: PORTAL PENIS
 **************************************************************/

datum/sex_action/portal_penis
    name = "Portal Fuck"
    target_priority = 80
    var/obj/item/portallight/light
    var/mob/living/carbon/human/target
    stamina_cost = 1.0
    hole_id = ORGAN_SLOT_VAGINA

/datum/sex_action/portal_penis/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/obj/item/portallight/L = user.get_active_held_item()
    if(!istype(L, /obj/item/portallight))
        return FALSE
    var/mob/living/carbon/human/W = L.get_wearer()
    if(!W)
        return FALSE
    if(!user.getorganslot(ORGAN_SLOT_PENIS))
        return FALSE
    if(check_sex_lock(user, ORGAN_SLOT_PENIS))
        return FALSE
    light = L
    target = W
    return TRUE

/datum/sex_action/portal_penis/on_start(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_warning("You slide your cock into the portal, reaching [target]."))
    to_chat(target, span_love("You feel penetration through the portal!"))

/datum/sex_action/portal_penis/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    do_thrust_animate(user, user)
    to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] fuck [target]'s pussy through the portal."))
    to_chat(target, sex_session.spanify_force("[user] [sex_session.get_generic_force_adjective()] fucks you through the portal."))
    sex_session.perform_sex_action(user, target, 2, 0, 2, src)
    sex_session.perform_sex_action(target, user, 2.4, 9, 2.4, src)
    sex_session.handle_passive_ejaculation(target)
    sex_session.handle_passive_ejaculation(user)
    SEND_SIGNAL(target, COMSIG_SEX_ADJUST_AROUSAL, 10)
    SEND_SIGNAL(user, COMSIG_SEX_ADJUST_AROUSAL, 10)
    playsound(user, sex_session.get_force_sound(), 50, TRUE, -2, ignore_walls = FALSE)

/datum/sex_action/portal_penis/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target, must_flip)
    to_chat(target, span_love("You cum from the portal fuck! Your body trembles in ecstasy."))
    to_chat(user, span_love("You cum inside [target]! You shudder with pleasure."))
    user.virginity = FALSE
    target.virginity = FALSE
    return ORGASM_LOCATION_INTO

/datum/sex_action/portal_penis/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/ignored_target)
    to_chat(user, span_notice("You pull your cock back from the portal."))
    to_chat(target, span_notice("The penetration through the portal ends."))
