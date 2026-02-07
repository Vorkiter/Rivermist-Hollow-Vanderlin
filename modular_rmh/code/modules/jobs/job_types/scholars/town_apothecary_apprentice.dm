/datum/job/town_apothecary_apprentice
	title = "Town Apothecary Apprentice"
	tutorial = "You are learning the craft of alchemy under the Town Apothecary. \
	Your duties include gathering herbs, preparing basic mixtures, cleaning tools, \
	and assisting in the workshop and clinic. \
	You are not yet trusted with advanced brews — mistakes can be dangerous."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_APOTHECARY_APPRENTICE

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT)

	outfit = /datum/outfit/town_apothecary_apprentice
	selection_color = JCOLOR_SCHOLARS

	give_bank_account = 20
	exp_type = list(EXP_TYPE_LIVING)
	exp_requirements = list(
		EXP_TYPE_LIVING = 200
	)

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_PER = 1,
	)

	skills = list(
		/datum/skill/craft/alchemy = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/labor/farming = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/athletics = 1,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_FORAGER
	)

/datum/outfit/town_apothecary_apprentice
	name = "Town Apothecary Apprentice"
	head = null
	mask = /obj/item/clothing/face/shepherd/clothmask
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/apothecary
	pants = /obj/item/clothing/pants/trou/apothecary
	shoes = /obj/item/clothing/shoes/apothboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/clinic
	beltl = /obj/item/storage/belt/pouch/coins/poor
	ring = null
	l_hand = null
	r_hand = null
