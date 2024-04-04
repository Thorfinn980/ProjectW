extends State
class_name EnemyFollow

@onready var anim_tree : AnimationTree = $"../../AnimationTree"
@export var move_speed := 40.0
@export var enemy : CharacterBody2D
var player : CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	print("You are following the player")
	
func state_physics_process (_delta: float):
	print("You are following the player")
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 55:
		Transitioned.emit(self, "Idle")
	
	if abs(enemy.global_position.x - player.global_position.x) < 120:
		enemy.velocity = Vector2.ZERO
		Transitioned.emit(self, "Attack")
		playback.travel("attack")
