extends ActionLeaf

var jumping = false

func tick(actor, blackboard: Blackboard):
	if(actor.is_on_floor()):
		actor.velocity.y = actor.JUMP_VELOCITY
		jumping = true
		
	if(jumping == true):
		if(actor.is_on_floor()):
			jumping == false
			return SUCCESS
		else:
			return RUNNING
	return FAILURE
