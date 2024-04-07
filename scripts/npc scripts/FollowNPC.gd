extends State
class_name EnemyFollow

var direction : Vector2 = Vector2.ZERO
#var player : CharacterBody2D

func enter():
	print("isFollowing")
	#player = get_tree().get_first_node_in_group("Player")
	owner.set_physics_process(true)
 
func exit():
	owner.set_physics_process(false)
	
func state_process (_delta: float):
	# Guard check to ensure 'player' is not null and still part of the scene
	#if player and player.is_inside_tree():
		var distance = owner.direction.length()
		print(distance)
		if distance < 70:
			owner.set_physics_process(false)
			Transitioned.emit(self, "Attack")
		elif distance > 130:
			var chance = randi() % 2
			#match chance:
				#0:
					#get_parent().change_state("HomingMissile")
				#1:
					#get_parent().change_state("LaserBeam")
		
		

