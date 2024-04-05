extends State
class_name EnemyFollow

@onready var anim_tree : AnimationTree = $"../../AnimationTree"
@onready var sprite : AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var move_speed := 40.0
@export var enemy : CharacterBody2D
var direction : Vector2 = Vector2.ZERO
var player : CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	
func state_physics_process (_delta: float):
	direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	#if direction.length() > 55:
		#Transitioned.emit(self, "Idle")
	
	if abs(enemy.global_position.x - player.global_position.x) < 120:
		enemy.velocity = Vector2.ZERO
		Transitioned.emit(self, "Attack")
	
	update_animation()
	update_direction()

func update_animation():
	anim_tree.set("parameters/AnimationStateMachine/move/blend_position", direction.x)

func update_direction():
	if direction.x < 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
