extends StateV2
class_name PlayerRun

@export var player : CharacterBody2D

func enter():
	print("You are running")
	
func state_process (delta: float):
	if Input.is_action_just_pressed("Attack"):
		Transitioned.emit(self,"InitialAttack")

func state_physics_process (delta: float):
	
	if not player.is_on_floor():
		Transitioned.emit(self,"Air")
		return
	
	if player.direction:
		player.velocity.x = player.direction * player.SPEED
		if player.velocity.y == 0:
			player.anim.play("Run")
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		if player.velocity.y == 0:
			Transitioned.emit(self, "Idle")
	
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self,"Air")
	elif player.direction == 0:
		Transitioned.emit(self,"Idle")
	
	player.move_and_slide()
