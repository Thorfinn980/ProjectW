extends CharacterBody2D
 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = get_parent().find_child("Player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_player = $AnimationPlayer
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var progress_bar = $UI/ProgressBar
 
var direction : Vector2
 
var health: = 10:
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")
 
func _ready():
	set_physics_process(false)
	anim_tree.active = true
 
 
func _process(_delta):
	direction = player.position - position
	
	if direction.x == 0:
		animated_player.play("idle")

	if direction.x < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
 
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)
 
func take_damage():
	health -= 2
