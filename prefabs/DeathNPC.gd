extends NPCState
 
func enter():
	print("Death")
	super.enter()
	animation_player.play("death")
 #
#func boss_slained():
	#animation_player.play("boss_slained")
 #
