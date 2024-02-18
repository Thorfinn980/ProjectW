extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	#print(abs(blackboard.get_value("player").position.x - actor.position.x))
	if(abs(blackboard.get_value("player").position.x - actor.position.x) < 25):
		
		return SUCCESS
	return FAILURE

