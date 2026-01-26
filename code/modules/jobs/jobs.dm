GLOBAL_LIST_INIT(lords_positions, list(
	/datum/job/lord::title,
))
GLOBAL_PROTECT(lords_positions)



GLOBAL_LIST_INIT(keep_positions, list(
	/datum/job/captain::title,
))
GLOBAL_PROTECT(keep_positions)



GLOBAL_LIST_INIT(townhall_positions, list(
	/datum/job/burgmeister::title,
))
GLOBAL_PROTECT(townhall_positions)



GLOBAL_LIST_INIT(townwatch_positions, list(
	/datum/job/guardsman::title,
))

GLOBAL_PROTECT(townwatch_positions)




GLOBAL_LIST_INIT(chapel_positions, list(
	/datum/job/priest::title,
))

GLOBAL_PROTECT(chapel_positions)



GLOBAL_LIST_INIT(scholars_positions, list(
	/datum/job/archivist::title,
))
GLOBAL_PROTECT(scholars_positions)



GLOBAL_LIST_INIT(traders_positions, list(
	/datum/job/merchant::title,
))
GLOBAL_PROTECT(traders_positions)



GLOBAL_LIST_INIT(tavern_positions, list(
	/datum/job/innkeep::title,
))
GLOBAL_PROTECT(tavern_positions)



GLOBAL_LIST_INIT(town_positions, list(
	/datum/job/farmer::title,
))
GLOBAL_PROTECT(town_positions)



GLOBAL_LIST_INIT(outsiders_positions, list(
	/datum/job/artificer::title,
))
GLOBAL_PROTECT(outsiders_positions)



GLOBAL_LIST_INIT(adventurers_positions, list(
	/datum/job/adventurer::title,
))
GLOBAL_PROTECT(adventurers_positions)



GLOBAL_LIST_INIT(allmig_positions, list(
	/datum/job/adventurer::title,
	))

GLOBAL_LIST_INIT(roguewar_positions, list(
	"Adventurer",
	))

GLOBAL_LIST_INIT(test_positions, list(
	"Tester",
	))

GLOBAL_LIST_EMPTY(job_assignment_order)

/proc/get_job_assignment_order()
	var/list/sorting_order = list()
	sorting_order += GLOB.lords_positions
	sorting_order += GLOB.keep_positions
	sorting_order += GLOB.townhall_positions
	sorting_order += GLOB.townwatch_positions
	sorting_order += GLOB.chapel_positions
	sorting_order += GLOB.scholars_positions
	sorting_order += GLOB.traders_positions
	sorting_order += GLOB.tavern_positions
	sorting_order += GLOB.town_positions
	sorting_order += GLOB.outsiders_positions
	sorting_order += GLOB.adventurers_positions
	return sorting_order

GLOBAL_LIST_INIT(exp_specialmap, list(
	EXP_TYPE_LIVING = list(), // all living mobs
	EXP_TYPE_ANTAG = list(),
	EXP_TYPE_GHOST = list(), // dead people, observers
))
GLOBAL_PROTECT(exp_specialmap)
