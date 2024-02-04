extends StateV2
@export var boss : CharacterBody2D

func enter():
	print("Boss1 is jumping")
	boss.velocity.y = boss.JUMP_VELOCITY;
	Transitioned.emit(self, "Air")
	pass

func exit():
	print("Boss1 exiting jumping")
