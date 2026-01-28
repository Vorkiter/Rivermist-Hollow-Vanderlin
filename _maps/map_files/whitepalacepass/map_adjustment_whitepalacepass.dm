/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/whitepalacepass
	map_file_name = "WhitePalacePass.dmm"
	blacklist = list(
		/datum/job/shophand, //Unneeded honestly.
		/datum/job/dungeoneer,
	)
	// Limited positions to ensure core roles are filled.
	slot_adjust = list(
		/datum/job/feldsher = 2,
		/datum/job/cook = 2,
		/datum/job/servant = 3,
		/datum/job/carpenter = 2,
		/datum/job/hunter = 2,
		/datum/job/bard = 3,
		/datum/job/bapprentice = 3,
		/datum/job/miner = 4,
		/datum/job/fisher = 2,
		/datum/job/farmer = 3,
		/datum/job/guardsman = 6,
		/datum/job/artificer = 2,
	)
