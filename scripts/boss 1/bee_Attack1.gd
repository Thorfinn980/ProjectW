extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor.velocity.x = 0
	# needs code to change direction 
	if(actor.anim.current_animation != "Attack1"):
		actor.anim_tree["parameters/playback"].travel("Attack1")
		#actor.anim.play("Attack1")
		#actor.anim.animation_set_next("Attack1", "Idle")
		return RUNNING
	print("Boss1 Attacked")
	return SUCCESS

