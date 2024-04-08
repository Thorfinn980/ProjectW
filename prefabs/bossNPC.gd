extends CharacterBody2D
class_name OniEnemy

const SPEED = 300.0
var direction : Vector2
@onready var player = get_parent().find_child("Player")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var playback : AnimationNodeStateMachinePlayback
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var sprite = get_node("AnimatedSprite2D")
@onready var anim_player : AnimationPlayer = $AnimationPlayer

var health = 100:
	set(value):
		health = value
		#progress_bar.value = value
		if value <= 0:
			#progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")

func _ready():
	anim_tree.active = true
	set_physics_process(false)


func _process(_delta):
	update_animation()
	update_direction()

func _physics_process(delta):
	direction = player.position - position
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)
	
func update_animation():
	anim_tree.set("parameters/AnimationStateMachine/move/blend_position", direction.x)

func update_direction():
	if direction.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
