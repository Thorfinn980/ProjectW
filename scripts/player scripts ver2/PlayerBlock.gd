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
	

# when animation finishes playing return to idle state
func _on_animation_player_animation_finished(anim_name):
	Transitioned.emit(self, "Idle")
