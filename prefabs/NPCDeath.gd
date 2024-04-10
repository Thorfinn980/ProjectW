extends State
class_name NPCDeath

func enter():
	print("isDead")
	playback.travel("death")
	print("test?")
