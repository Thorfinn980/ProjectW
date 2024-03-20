extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	var player = blackboard.get_value("player")
	actor.anim_tree["parameters/playback"].travel("Run")
	
	# actor.anim.play("Run")
	if(actor.position.x > player.position.x):
		actor.velocity.x = -1*actor.SPEED
		actor.get_node("AnimatedSprite2D").flip_h = true
	else:
		actor.velocity.x = actor.SPEED
		actor.get_node("AnimatedSprite2D").flip_h = false
	return SUCCESS

