/mob/dead/observer/verb/ghost_upward()
	set name = "Ghost Up"
	set category = "Spirit"

	if(!isobserver(usr))
		return

	ghost_up()

/mob/dead/observer/verb/ghost_downward()
	set name = "Ghost Down"
	set category = "Spirit"

	if(!isobserver(usr))
		return

	ghost_down()

/client/proc/descend()
	set name = "Journey to the Underworld"
	set category = "Spirit"

	var/answer = browser_alert(src, "Begin the long walk in the Underworld to your judgement?", "JUDGEMENT", DEFAULT_INPUT_CHOICES)
	if(!answer || QDELETED(src) || QDELETED(mob))
		return
	if(answer == CHOICE_NO)
		to_chat(src, span_warning("You have second thoughts."))
		return
	if(answer == CHOICE_YES)
		if(istype(mob, /mob/living/carbon/spirit))
			return

		if(istype(mob, /mob/living/carbon/human))
			var/mob/living/carbon/human/D = mob
			if(D.buried && D.funeral)
				D.returntolobby()
				return

			var/datum/job/target_job = SSjob.GetJob(D.mind.assigned_role)
			if(target_job)
				target_job.current_positions = max(0, target_job.current_positions - 1)
		verbs -= GLOB.ghost_verbs
		mob.returntolobby()
