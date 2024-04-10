extends StateV2
class_name PlayerRoll

@export var player : CharacterBody2D

func enter():
	print("You are rolling")

func exit():
	# This is a base case for when we land
	print("You exited rolling")
	
func state_physics_process (delta: float):
	var direction = Input.get_axis("Left", "Right")
	
	if not player.is_on_floor():
		Transitioned.emit(self,"Air")
		return
	
	if Input.is_action_just_pressed("Down"):#player.velocity.y == 0 && Input.is_action_just_pressed("Down"):
		print("It works")
		player.velocity.x = direction * player.ROLL_SPEED
		player.anim.play("Roll")
	
				
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		if player.velocity.y == 0:
			Transitioned.emit(self, "Idle")
	
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self,"Air")
	elif direction == 0:
		Transitioned.emit(self,"Idle")
	
	player.move_and_slide()
