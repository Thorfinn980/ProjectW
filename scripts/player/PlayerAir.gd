extends StateV2
class_name PlayerAir

@export var player : CharacterBody2D

func enter():
	# This is a base case for when we press jump
	print("You are jumping")
	player.velocity.y = player.JUMP_VELOCITY
	player.anim.play("Jump")
	
func exit():
	# This is a base case for when we land
	print("You exited jumping")
	
func state_physics_process (delta: float):
	if player.velocity.y > 0:
		player.anim.play("Fall")
	
	# Account for player horizontal and vertical in AIR STATE
	player.velocity.x = player.direction * player.SPEED
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			Transitioned.emit(self,"Idle")
		else:
			Transitioned.emit(self,"Run")
