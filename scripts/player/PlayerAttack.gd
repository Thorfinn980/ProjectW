extends StateV2
class_name PlayerAttack

@export var player : CharacterBody2D

var action_pressed = false

func enter():
	# This is a base case for when we press jump
	print("You are attacking")
	player.anim.play("Attack1")
	player.can_input = false
	action_pressed = false
	
func exit():
	# This is a base case for when we land
	print("You exited attacking")
	
func state_physics_process (delta):
	if player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Attack"):
		player.action_pressed = true
	
	if not player.anim.is_playing() or player.direction != 0.0:
		Transitioned.emit(self, "Idle")
	
	if not owner.is_on_floor():
		Transitioned.emit(self,"Air")
		return
	
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self,"Air")
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		Transitioned.emit(self,"Run")
