extends StateV2
@export var boss : CharacterBody2D

func enter():
	print("Boss1 is jumping")
	boss.velocity.y = boss.JUMP_VELOCITY;

func exit():
	print("Boss1 exiting jumping")

func state_physics_process(_delta):
	Transitioned.emit(self, "Air")
