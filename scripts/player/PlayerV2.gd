extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var can_input = true
var direction = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta):
	if not can_input:
		return 0.0
	
	direction = Input.get_axis("Left", "Right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	
func ready_for_input():
	can_input = true
