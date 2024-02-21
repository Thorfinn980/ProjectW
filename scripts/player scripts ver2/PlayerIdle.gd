extends State
class_name PlayerIdle

@export var player : CharacterBody2D

func enter():
	print("You are idling")
	
func exit():
	print("You exited idling")
	

func _process(delta):
	# If you have platforms that break when standing on them, you need that check for 
	# the character to fall.
	if not owner.is_on_floor():
		Transitioned.emit(self,"Air")
		return
	
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self,"Air")
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		Transitioned.emit(self,"Run")


func state_physics_process (delta: float):
	
	var direction = Input.get_axis("Left", "Right")
	
	if direction:
		if player.velocity.y == 0:
			Transitioned.emit(self, "Run")
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		if player.velocity.y == 0:
			player.anim.play("Idle")
			
	player.move_and_slide()
	
