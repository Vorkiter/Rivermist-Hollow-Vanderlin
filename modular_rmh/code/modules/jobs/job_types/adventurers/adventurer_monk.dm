/datum/job/adventurer_monk
	title = "Adventurer Monk"
	tutorial = "Some reach enlightenment by languid meditation - others do so in the heat of battle. Monks manipulate ki to empower their own strikes and debilitate their foes. \
	ALLOWED PATRONS: Jergal, Ilmater, Tyr. \
	SEEKERS OF DISCIPLINE, ENDURANCE, AND FATE, THEIR PATRONS GUIDE PERSONAL MASTERY AND RIGHTEOUS SUFFERING."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 10
	spawn_positions = 10
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_MONK

	allowed_patrons = list(
		/datum/patron/faerun/neutral_gods/Jergal,

		/datum/patron/faerun/good_gods/Ilmater,
		/datum/patron/faerun/good_gods/Tyr
	)


	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_MONK = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)

/datum/job/adventurer_monk/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)

/datum/job/adventurer_monk/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_monk/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots
