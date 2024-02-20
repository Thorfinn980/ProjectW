extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	# this > 5 is because the center of player and boss1 are different, which makes their positions offset by like 4.04 or something
	if(abs(blackboard.get_value("player").position.y - actor.position.y) > 10):
		return true
	return FAILURE
