/datum/job/adventurers_guildmaster
	title = "Adventurers Guildmaster"
	tutorial = "Once an adventurer yourself, you now stand at the heart of the Blue Sage Adventurers’ Guild. \
	Your domain is the Drunken Dwarf tavern — part guildhall, part public house. \
	You accept contracts from townsfolk, nobles, and private patrons, distribute guild tokens, \
	and oversee the fulfillment of quests. New adventurers look to you for guidance, veterans for favors. \
	Keep the guild prosperous, reputable, and well-supplied — and make sure every completed job is properly rewarded."
	department_flag = TAVERN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURERS_HEAD

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_TAVERN
	advclass_cat_rolls = list(CAT_AHEAD = 20)

	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/adventurers_guild)

	give_bank_account = 200
	exp_type = list(EXP_TYPE_LIVING, EXP_TYPE_ADVENTURER, EXP_TYPE_RANGER, EXP_TYPE_MERCENARY)
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_RANGER, EXP_TYPE_MERCENARY, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_ADVENTURER = 300,
		EXP_TYPE_RANGER = 300,
		EXP_TYPE_MERCENARY = 120
	)

//SUBCLASSES

/datum/job/advclass/adventurers_guildmaster/ranger
	title = "Retired Ranger"
	tutorial = "A veteran of the wilds and monster hunts."

	outfit = /datum/outfit/adventurers_guildmaster/ranger
	category_tags = list(CAT_AHEAD)

	jobstats = list(
		STATKEY_SPD = 2,
		STATKEY_PER = 1,
		STATKEY_STR = 1,
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/crossbows = 4,
		/datum/skill/combat/bows = 5,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/reading = 5,
		/datum/skill/craft/cooking = 3,
		/datum/skill/craft/traps = 1,
		/datum/skill/labor/butchering = 5,
		/datum/skill/labor/mathematics = 5,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_KNOWBANDITS,
		TRAIT_SEEPRICES,
		TRAIT_BURDEN,
		TRAIT_STEELHEARTED,
		TRAIT_OLDPARTY,
	)


/datum/outfit/adventurers_guildmaster/ranger
	name = "Retired Ranger"
	head = null
	mask = /obj/item/clothing/face/eyepatch/fake
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/black
	armor = /obj/item/clothing/armor/leather/hide
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather/advanced
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather/advanced
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/weapon/sword/long/replica
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/keyring/adventurers_guild
	beltl = /obj/item/flashlight/flare/torch/lantern
	ring = /obj/item/clothing/ring/gold/burden
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/rich = 1,
		/obj/item/merctoken = 2,
		/obj/item/natural/feather,
		/obj/item/paper = 3,
		/obj/item/weapon/knife/dagger/steel,
		/obj/item/paper,
	)

// ─────────────────────────────

/datum/job/advclass/adventurers_guildmaster/spellsword
	title = "Retired Spellsword"
	tutorial = "A master of blade and magic."

	outfit = /datum/outfit/adventurers_guildmaster/spellsword
	category_tags = list(CAT_AHEAD)

	magic_user = TRUE
	spell_points = 25
	attunements_max = 10
	attunements_min = 5

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_STR = 1,
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 5,
		/datum/skill/labor/mathematics = 5,
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/reading = 4,
		/datum/skill/craft/alchemy = 2,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_KNOWBANDITS,
		TRAIT_SEEPRICES,
		TRAIT_BURDEN,
		TRAIT_STEELHEARTED,
		TRAIT_OLDPARTY,
	)

/datum/outfit/adventurers_guildmaster/spellsword
	name = "Retired Spellsword"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/purple
	armor = /obj/item/clothing/armor/plate
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/jackchain
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/weapon/sword/long/replica
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/keyring/adventurers_guild
	beltl = /obj/item/flashlight/flare/torch/lantern
	ring = /obj/item/clothing/ring/gold/burden
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/rich = 1,
		/obj/item/merctoken = 2,
		/obj/item/natural/feather,
		/obj/item/paper = 3,
		/obj/item/weapon/knife/dagger/steel,
		/obj/item/paper,
	)

/datum/outfit/adventurers_guildmaster/spellsword/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/tunic/noblecoat
		pants = /obj/item/clothing/pants/tights/colored/white
	else
		shirt = /obj/item/clothing/shirt/dress/gown/wintergown

//CONVERSION

/datum/action/cooldown/spell/undirected/list_target/convert_role/adventurers_guild
	name = "Recruit Adventurer"
	button_icon_state = "recruit_servant" //N/A change this to the correct sprite when its made

	new_role = "Adventurer's Guild Member"
	recruitment_faction = "Adventurer's Guild"
	recruitment_message = "Hey, %RECRUIT, you ever considered going full-time?"
	accept_message = "For coin and glory!"
	refuse_message = "I refuse."
