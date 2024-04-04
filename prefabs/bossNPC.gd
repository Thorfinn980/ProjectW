extends CharacterBody2D
class_name OniEnemy

const SPEED = 300.0
var direction : Vector2 = Vector2.ZERO
#@export var playerNodePath: NodePath

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var playback : AnimationNodeStateMachinePlayback
@onready var anim_tree : AnimationTree = $AnimationTree
@onready var sprite = get_node("AnimatedSprite2D")

func _ready():
	anim_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
