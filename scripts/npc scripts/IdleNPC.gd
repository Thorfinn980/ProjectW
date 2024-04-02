extends State
class_name EnemyIdle

var move_direction: Vector2
@export var move_speed := 40.0
@export var enemy : CharacterBody2D
var Player : CharacterBody2D

func state_physics_process (_delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed

	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 30:
		Transitioned.emit(self, "follow")
