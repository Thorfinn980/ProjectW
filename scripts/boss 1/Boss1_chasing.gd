extends StateV2
@export var boss : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
# Abstract func: upon entering, execute code within
func enter():
	print("Boss1 is chasing")
	var player = boss.player_ref
	var direction = (player.position - boss.position).normalized()
	
	# if player on right, move right, 
	# else left, move left
	if(direction.x > 0):
		boss.velocity.x = direction.x * boss.SPEED
		print(boss.velocity.x)
	else:
		boss.velocity.x = direction.x * boss.SPEED
		print(boss.velocity.x)
	pass

# Abstract func: upon exiting, execute code within
func exit():
	print("Boss1 exiting chasing")
	pass

func _on_detection_zone_body_exited(body):
	Transitioned.emit(self, "Idle")

# similar to _process but for states, render everything except for physics.
func state_process(_delta: float):
	pass

# similar to _physics_process but for states, render physics except for everything.
func state_physics_process (_delta: float):
	pass


