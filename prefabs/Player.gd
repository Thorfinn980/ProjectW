extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ROLL_VELOCITY = 5000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = get_node("AnimatedSprite2D")
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var state_machine : StateMachineFactory = $"State Machine"
var direction : Vector2 = Vector2.ZERO
var roll_direction : float

func _ready():
	anim_tree.active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	direction = Input.get_vector("Left", "Right", "Down", "Up")
	roll_direction = direction.x
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	update_animation()
	update_direction()

func update_animation():
	anim_tree.set("parameters/AnimationStateMachine/Move/blend_position", direction.x)

func update_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
