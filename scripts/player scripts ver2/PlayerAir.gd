extends State
class_name PlayerAir

@export var landing_animation : String = "JumpEnd"
@export var player : CharacterBody2D

func enter():
	# This is a base case for when we press jump
	print("You are jumping")
	player.velocity.y = player.JUMP_VELOCITY
	# player.anim.play("Jump")
	
func exit():
	playback.travel(landing_animation)
	
func state_process(delta):
	if(player.is_on_floor()):
		Transitioned.emit(self, "Ground")
