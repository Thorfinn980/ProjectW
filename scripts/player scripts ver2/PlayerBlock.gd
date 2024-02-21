#extend the state machine
extends StateV2
class_name PlayerBlock

@export var player : CharacterBody2D
@onready var anim = get_node("AnimationPlayer")
@export var animation : String
@export var next_state : String
var action_pressed = false

#begin the blocking when action enters the function
func enter():
	print("You are blocking")
	#play the block animation
	player.anim.play(animation)
	action_pressed = false

#exit the blocking
func exit():
	print("You exited blocking")
	
func state_physics_process (delta: float):
	if Input.is_action_just_pressed("Block"):
		action_pressed = true
	if next_state and action_pressed:
		Transitioned.emit(self,next_state)
	elif player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			Transitioned.emit(self,"Idle")
		else:
			Transitioned.emit(self,"Run")
	player.velocity.y += player.gravity * delta
	player.move_and_slide()


func _on_animation_player_animation_finished(anim_name):
		Transitioned.emit(self,"Idle")
