/datum/job/acolyte
	title = "Chapel Acolyte"
	tutorial = "You are a humble servant of the gods. \
	This chapel welcomes many faiths, and your duty is simple service, learning, and aid."
	job_flags = (JOB_NEW_PLAYER_JOINABLE | JOB_EQUIP_RANK)
	department_flag = CHAPEL
	faction = FACTION_TOWN
	total_positions = 3
	spawn_positions = 3
	selection_color = JCOLOR_CHAPEL
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_HEART_ACOLYTE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	selection_color = JCOLOR_CHAPEL

	advclass_cat_rolls = list(CAT_CHAPEL = 20)

	job_subclasses = list(
		/datum/job/advclass/acolyte/base,
		/datum/job/advclass/acolyte/nun,
		/datum/job/advclass/acolyte/nun_regal
	)

	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_CLERIC)
	languages = list(/datum/language/celestial)

/datum/job/heart_priest/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/living/carbon/human/proc/churchannouncement

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(spawned)

// ─────────────────────────────

/datum/job/advclass/acolyte/base
	title = "Chapel Acolyte"
	tutorial = "You are a humble servant of the gods. \
	This chapel welcomes many faiths, and your duty is simple service, learning, and aid."
	outfit = /datum/outfit/acolyte/base
	category_tags = list(CAT_CHAPEL)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/cooking = 2,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_EMPATH
	)

/datum/outfit/acolyte/base
	name = "Chapel Acolyte"
	head = /obj/item/clothing/head/roguehood
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/robe
	pants = null
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/sandals
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/town_chapel
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/needle/blessed = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2
	)

// ─────────────────────────────

/datum/job/advclass/acolyte/nun
	title = "Nun"
	tutorial = "You are a consecrated servant of the chapel. \
	You offer comfort through presence, warmth, and guided devotion, where desire is sanctified rather than denied."
	outfit = /datum/outfit/acolyte/nun
	category_tags = list(CAT_CHAPEL)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/cooking = 2,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_EMPATH,
		TRAIT_ALLURE,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
	)

/datum/outfit/acolyte/nun
	name = "Nun"
	head = /obj/item/clothing/head/sexy_nun_hat
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/sexy_nun_robe
	pants = null
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/town_chapel
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/needle/blessed = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2
	)

// ─────────────────────────────

datum/job/advclass/acolyte/nun_regal
	title = "Regal Nun"
	tutorial = "You are a revered and adorned figure of the chapel. \
	Through ritual, elegance, and sacred allure, you embody devotion elevated into ceremony."
	outfit = /datum/outfit/acolyte/nun_regal
	category_tags = list(CAT_CHAPEL)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/cooking = 2,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_EMPATH,
		TRAIT_ALLURE,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
	)

/datum/outfit/acolyte/nun_regal
	name = "Regal Nun"
	head = /obj/item/clothing/head/sexy_nun_hat_alt
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/sexy_nun_robe_alt
	pants = null
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/town_chapel
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/needle/blessed = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2
	)
