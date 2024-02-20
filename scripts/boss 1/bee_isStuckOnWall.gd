extends ConditionLeaf

var lastPos = 0

func tick(actor, blackboard: Blackboard):
	if (lastPos == actor.position.x):
		lastPos = actor.position.x
		return SUCCESS
	lastPos = actor.position.x
	return FAILURE
	
