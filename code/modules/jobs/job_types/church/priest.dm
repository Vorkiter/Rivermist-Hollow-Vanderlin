/datum/job/priest
	title = "Priest"
	f_title = "Priestess"
	tutorial = "You are a devoted follower of Astrata. \
	The divine is all that matters in an immoral world. \
	The Sun Queen and her pantheon rule over all, and you will preach their wisdom to Vanderlin. \
	It is up to you to shepherd the flock into a Ten-fearing future."
	department_flag = JCOLOR_CHAPEL
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	bypass_lastclass = TRUE
	selection_color = JCOLOR_CHAPEL
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	outfit = /datum/outfit/priest
	spells = list(
		/datum/action/cooldown/spell/undirected/list_target/convert_role/templar,
		/datum/action/cooldown/spell/undirected/list_target/convert_role/acolyte,
		/datum/action/cooldown/spell/undirected/list_target/convert_role/churchling,
		/datum/action/cooldown/spell/undirected/call_bird/priest,
		/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/cure_rot,
		/datum/action/cooldown/spell/revive,
		/datum/action/cooldown/spell/sacred_flame,
		/datum/action/cooldown/spell/projectile/eora_curse,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
	)

	exp_type = list(EXP_TYPE_CHURCH)
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_CLERIC, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_CHURCH = 900,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 2,
		STATKEY_END = 2,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/misc/reading = 5,
		/datum/skill/magic/holy = 4,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/medicine = 3,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/mathematics = 3
	)

	languages = list(/datum/language/celestial)

/datum/job/priest/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/living/carbon/human/proc/churchannouncement

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_priest()
		devotion.grant_to(spawned)

/datum/outfit/priest
	name = "Priest"
	neck = /obj/item/clothing/neck/psycross/silver/astrata
	head = /obj/item/clothing/head/priestmask
	shirt = /obj/item/clothing/shirt/undershirt/priest
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/shortboots
	beltl = /obj/item/storage/keyring/priest
	belt = /obj/item/storage/belt/leather/rope
	armor = /obj/item/clothing/shirt/robe/priest
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/needle = 1,
		/obj/item/storage/belt/pouch/coins/rich = 1
	)
	l_hand = /obj/item/weapon/polearm/woodstaff/aries

/mob/living/carbon/human/proc/churchannouncement()
	set name = "Announcement"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Make an announcement", "RIVERMIST HOLLOW") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/indoors/town/church/chapel))
			to_chat(src, "<span class='warning'>I need to do this from the chapel.</span>")
			return FALSE
		priority_announce("[inputty]", title = "The [get_role_title()] Speaks", sound = 'sound/misc/bell.ogg')
		src.log_talk("[TIMETOTEXT4LOGS] [inputty]", LOG_SAY, tag="Priest announcement")
