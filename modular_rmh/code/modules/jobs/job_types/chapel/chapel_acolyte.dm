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

	magic_user = TRUE
	spell_points = 15

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

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/purify_water,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

// ─────────────────────────────

/datum/job/advclass/acolyte/selune
	title = "Selune Acolyte"
	tutorial = "You serve Selûne, the Moonmaiden. \
	You keep night vigils, aid travelers and the vulnerable, and assist Moon Priests."
	outfit = /datum/outfit/acolyte/selune
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/undirected/touch/darkvision,
		/datum/action/cooldown/spell/undirected/secondsight,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/sacred_flame,
	)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 2,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/medicine = 3,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 1,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_NIGHT_OWL
	)

/datum/outfit/acolyte/selune
	name = "Selune Acolyte"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/psycross/silver/selune
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/robe/colored/moon_acolyte
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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

// ─────────────────────────────

/datum/job/advclass/acolyte/sune
	title = "Sune Acolyte"
	tutorial = "You are a humble servant of the gods. \
	This chapel welcomes many faiths, and your duty is simple service, learning, and aid."
	outfit = /datum/outfit/acolyte/sune
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/instill_perfection,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
	)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 2,
		STATKEY_LCK = 2
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/music = 3,
		/datum/skill/misc/sewing = 3,
		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_ALLURE,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_EMPATH
	)

/datum/outfit/acolyte/sune
	name = "Sune Acolyte"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/psycross/silver/sune
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/toga
	pants = null
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/toga_sandals
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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

// ─────────────────────────────

/datum/job/advclass/acolyte/nun
	title = "Nun"
	tutorial = "You are a consecrated servant of the chapel. \
	You offer comfort through presence, warmth, and guided devotion, where desire is sanctified rather than denied."
	outfit = /datum/outfit/acolyte/nun
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

// ─────────────────────────────

datum/job/advclass/acolyte/nun_regal
	title = "Regal Nun"
	tutorial = "You are a revered and adorned figure of the chapel. \
	Through ritual, elegance, and sacred allure, you embody devotion elevated into ceremony."
	outfit = /datum/outfit/acolyte/nun_regal
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

// ─────────────────────────────

/datum/job/advclass/acolyte/warrior_priest
	title = "Warrior Acolyte"
	tutorial = "A devout sentinel of the chapel, wielding faith as her weapon. She walks day and night, defending the weak and punishing darkness wherever it stirs."
	outfit = /datum/outfit/acolyte/warrior_priest
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/sacred_flame,
		/datum/action/cooldown/spell/undirected/divine_strike,
		/datum/action/cooldown/spell/aoe/churn_undead,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/undirected/longstrider,
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_PER = 1,
		STATKEY_INT = 1,
		STATKEY_CON = 2,
		STATKEY_END = 3,
		STATKEY_SPD = 3,
		STATKEY_LCK = 2
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/whipsflails = 2,
		/datum/skill/combat/polearms = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/cooking = 2,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_EMPATH
	)

/datum/outfit/acolyte/warrior_priest
	name = "Warrior Acolyte"
	head = /obj/item/clothing/head/warrior_nun
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/half/shadowcloak/warrior_priest
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/warrior_nun
	pants = /obj/item/clothing/pants/loincloth/warrior_nun
	wrists = /obj/item/clothing/wrists/bracers/iron
	gloves = null
	shoes = /obj/item/clothing/shoes/boots/leather
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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

/datum/job/advclass/acolyte/warrior_priest/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/weapons = list("Staff", "Greatsword", "Flail")
	var/weapon_choice = browser_input_list(spawned, "CHOOSE YOUR WEAPON.", "TAKE UP ARMS", weapons)

	switch(weapon_choice)
		if("Staff")
			spawned.put_in_hands(new /obj/item/weapon/polearm/woodstaff/aries(get_turf(spawned)), TRUE)
		if("Greatsword")
			spawned.put_in_hands(new /obj/item/weapon/sword/long/greatsword/flamberge(get_turf(spawned)), TRUE)
		if("Flail")
			spawned.put_in_hands(new /obj/item/weapon/flail/psydon/relic(get_turf(spawned)), TRUE)


// ─────────────────────────────

/datum/job/advclass/acolyte/love
	title = "Love Acolyte"
	tutorial = "A tender, spreading warmth, healing hearts, and inspiring love. She turns every gesture into a blessing of beauty and passion."
	outfit = /datum/outfit/acolyte/love
	category_tags = list(CAT_CHAPEL)

	spells = list(/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/instill_perfection,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

	jobstats = list(
		STATKEY_STR = 0,
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 2,
		STATKEY_LCK = 2
	)

	skills = list(
		/datum/skill/magic/holy = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/music = 3,
		/datum/skill/misc/sewing = 3,
		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_ALLURE,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_EMPATH
	)

/datum/outfit/acolyte/love
	name = "Love Acolyte"
	head = /obj/item/clothing/head/tamer_priestess
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/tamer_priestess
	pants = /obj/item/clothing/pants/loincloth/tamer_priestess
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/toga_sandals
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/cloth
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/town_chapel
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/needle/blessed = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)
