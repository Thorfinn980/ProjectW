extends State
class_name Death

func enter():
	print("isDead")
	playback.travel("death")
	set_process_input(false)
	set_physics_process(false)
