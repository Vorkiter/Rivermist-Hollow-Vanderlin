/datum/job/barber_surgeon
	title = "Barber-Surgeon"
	tutorial = "You shave beards, set bones, drain bad humors, and pray the bleeding stops. \
	You have stitched guards by lantern-light, cauterized bites from the marsh, \
	and sealed wounds with thread meant for sailcloth. \
	Some call you a butcher. Others call you a lifesaver."
	department_flag = TOWN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_BARBER

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_TOWN
	outfit = /datum/outfit/barber_surgeon
	give_bank_account = 100

	jobstats = list(
		STATKEY_STR = -1,
		STATKEY_INT = 4,
		STATKEY_CON = -1,
	)

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 5,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/medicine = 5,
		/datum/skill/craft/alchemy = 3,
		/datum/skill/labor/farming = 3,
	)

	traits = list(
		TRAIT_EMPATH,
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
	)

	spells = list(
		/datum/action/cooldown/spell/diagnose,
	)

	job_bitflag = BITFLAG_CONSTRUCTOR

	exp_type = list(EXP_TYPE_LIVING, EXP_TYPE_MEDICAL)
	exp_types_granted = list(EXP_TYPE_MEDICAL)
	exp_requirements = list(
		EXP_TYPE_LIVING = 600,
		EXP_TYPE_MEDICAL = 300
	)

/datum/outfit/barber_surgeon
	name = "Barber Surgeon"
	head = /obj/item/clothing/head/roguehood/feld
	mask = /obj/item/clothing/face/feld
	neck = /obj/item/clothing/neck/feld
	cloak = null
	armor = /obj/item/clothing/shirt/robe/feld
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	wrists = /obj/item/storage/keyring/clinic
	gloves = /obj/item/clothing/gloves/leather/feld
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/fancy/ifak
	beltr = /obj/item/storage/belt/pouch
	ring = /obj/item/clothing/ring/feldsher_ring
	l_hand = null
	r_hand = null
