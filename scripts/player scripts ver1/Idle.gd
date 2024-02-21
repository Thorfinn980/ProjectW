extends State
class_name Idle

@onready var anim = get_node("$../../AnimationPlayer")
@onready var player: CharacterBody2D

func Enter(_msg := {}) -> void:
	# perform code on enter
	print("You are in Idle state")
	anim.play("Idle")
	owner.velocity = Vector2.ZERO

func Exit():
	print("leaving idle")

func _process(delta):
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
	
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Air", {do_jump = true})
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
