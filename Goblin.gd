extends CharacterBody2D
class_name GoblinBoss
 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = get_parent().find_child("Player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_player = $AnimationPlayer
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var progress_bar = $UI/ProgressBar
@onready var player_detection = $PlayerDetection/CollisionShape2D
@onready var attack_range = $AttackRange/CollisionShape2D

var direction : Vector2
var sprite_direction = 0
var reference_player
var player_in_range = false
var attack : bool
var speed = 20

signal facing_direction_changed(facing_right : bool)

func _ready():
	anim_tree.active = true
 
func _process(_delta):
	if reference_player:
		direction = sign((reference_player.global_position - global_position))
		
	update_facing_direction()
	
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity = direction.normalized() * speed
	move_and_slide()

func update_facing_direction():
	if direction.x > 0 and !attack:
		animated_sprite.flip_h = false
	elif direction.x < 0 and !attack:
		animated_sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !animated_sprite.flip_h)
	

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		reference_player = body

func _on_attack_range_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_attack_range_body_exited(body):
	if body.name == "Player":
		player_in_range = false
#
func _on_idle_idle_speed(new_speed):
	speed = new_speed

func _on_run_walk_speed(new_speed):
	speed = new_speed

func _on_attack_attack_direction(attacking):
	attack = attacking

func _on_attack_walk_speed(new_speed):
	speed = new_speed
