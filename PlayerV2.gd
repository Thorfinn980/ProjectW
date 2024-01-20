extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta):
	
	# REFACTOR
	"""
	if not is_on_floor():
		velocity.y += gravity * delta
	"""
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# We keep this...
	var direction = Input.get_axis("Left", "Right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
		#print("Left")
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		#print("Right")

	# May be redundant...
	# move_and_slide()

