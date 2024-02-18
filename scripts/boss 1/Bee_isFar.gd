@icon("../../icons/condition.svg")
extends ConditionLeaf

func tick(actor, blackboard: Blackboard):
	var player = get_tree().get_first_node_in_group("Players")
	blackboard.set_value("player", player)
	#print(abs(blackboard.get_value("player").position.x - actor.position.x))
	if(abs(player.position.x - actor.position.x) > 25):
		return SUCCESS
	return FAILURE
