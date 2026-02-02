/datum/job/town_apothecary
	title = "Town Apothecary"
	tutorial = "You are the town’s master of herbs, tinctures, and subtle chemistry. \
	You brew medicines, seek cures and poisons. \
	Respected or whispered about, your work keeps people alive — and sometimes very happy."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_APOTHECARY

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	outfit = /datum/outfit/town_apothecary
	selection_color = JCOLOR_SCHOLARS

	trainable_skills = list(/datum/skill/craft/alchemy)
	max_apprentices = 2
	apprentice_name = "Town Apothecary Apprentice"
	can_have_apprentices = TRUE

	give_bank_account = 100
	job_bitflag = BITFLAG_CONSTRUCTOR
	exp_type = list(EXP_TYPE_LIVING)
	exp_requirements = list(
		EXP_TYPE_LIVING = 600
	)

	jobstats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 1,
	)

	skills = list(
		/datum/skill/craft/alchemy = 5,
		/datum/skill/misc/medicine = 4,
		/datum/skill/misc/reading = 4,
		/datum/skill/labor/farming = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/combat/wrestling = 1
	)

	traits = list(
		TRAIT_FORAGER,
		TRAIT_LEGENDARY_ALCHEMIST
	)

/datum/outfit/town_apothecary
	name = "Town Apothecary"
	head = null
	mask = /obj/item/clothing/face/phys
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/gambeson/apothecary
	shirt = /obj/item/clothing/shirt/apothshirt
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/thaumgloves
	pants = /obj/item/clothing/pants/trou/apothecary
	shoes = /obj/item/clothing/shoes/apothboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/clinic
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = null
	l_hand = null
	r_hand = null
