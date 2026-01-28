/datum/job/gaffer_assistant
	title = "Ring Servant"
	tutorial = "I never had what it took to be a mercenary, but I offered my service to the Guild regardless. \
	My vow is to serve whomever holds the ring of Burden while avoiding its curse from befalling me."
	department_flag = TOWN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_SERVANT
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	bypass_lastclass = TRUE
	give_bank_account = TRUE
	cmode_music = 'sound/music/cmode/adventurer/CombatIntense.ogg'

	allowed_races = RACES_PLAYER_ALL

	outfit = /datum/outfit/gaffer_assistant
	exp_types_granted = list(EXP_TYPE_MERCENARY)

	jobstats = list(
		STATKEY_SPD = 1,
		STATKEY_END = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 3,
		/datum/skill/labor/butchering = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/labor/farming = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/stealing = 3,
		/datum/skill/labor/mathematics = 1,
	)

/datum/job/gaffer_assistant/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.adjust_skillrank(/datum/skill/misc/music, pick(0,1,1), TRUE)

/datum/outfit/gaffer_assistant
	name = "Ring Servant"
	shoes = /obj/item/clothing/shoes/simpleshoes
	pants = /obj/item/clothing/pants/tights/colored/uncolored
	shirt = /obj/item/clothing/shirt/undershirt/colored/uncolored
	belt = /obj/item/storage/belt/leather/rope
	beltl = /obj/item/storage/belt/pouch/coins/poor
	beltr = /obj/item/storage/keyring/gaffer_assistant
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/recipe_book/cooking = 1)

/datum/outfit/gaffer_assistant/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		armor = /obj/item/clothing/armor/leather/vest/colored/black
	else
		cloak = /obj/item/clothing/cloak/apron
