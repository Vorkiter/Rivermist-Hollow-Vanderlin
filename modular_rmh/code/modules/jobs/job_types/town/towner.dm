/datum/job/towner
	title = "Towner"
	tutorial = "You are a resident of Rivermist Hollow — not a guild officer, not a watchman, not a ruler. \
	You live, work, gossip, trade, and survive. The town’s laws protect you, but also bind you. \
	Your wealth and reputation shape how others treat you far more than any official title."
	department_flag = TOWN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_FOREIGNERS
	total_positions = 0
	spawn_positions = 0
	banned_leprosy = FALSE
	bypass_lastclass = TRUE

	advclass_cat_rolls = list(CTAG_TOWNER = 20)
	allowed_races = RACES_PLAYER_ALL

	outfit = null
	outfit_female = null

	give_bank_account = TRUE

/datum/job/towner/after_spawn(mob/living/carbon/spawned, client/player_client)
	..()
