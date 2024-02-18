extends StateV2
@export var boss : CharacterBody2D

var canAttack1 = true

func enter():
	print("Boss1 is chasing")

func exit():
	print("Boss1 exiting chasing")

func state_physics_process (_delta: float):
	var player = boss.player_ref
	var directionToPlayer = (player.position - boss.position).normalized()
	
	# if player on right, move right, 
	# else left, move left
	if(directionToPlayer.x > 0):
		boss.velocity.x = directionToPlayer.x * boss.SPEED
	else:
		boss.velocity.x = directionToPlayer.x * boss.SPEED
		
	var distance = abs(player.position.x - boss.position.x)
	#print("Distance: " + str(distance))
	if(distance < 100.0) && (canAttack1 == true):
		canAttack1 = false
		Transitioned.emit(self, "Attack1")
		


func _on_cooldown_timeout():
	canAttack1 = true
	pass # Replace with function body.

func _on_detection_zone_body_exited(body):
	boss.isChasing = false
	Transitioned.emit(self, "Idle")
