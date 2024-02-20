extends CharacterBody2D


const SPEED = 75.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
# gets a reference to player from the group Players
@onready var player_ref = get_tree().get_nodes_in_group("Players")[0]


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
