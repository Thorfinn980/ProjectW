extends State
class_name PlayerAttack

#Temporary Variables
@export var attack_one : String = "Attack1"
@export var attack_two : String = "Attack2"
@export var attack_three : String = "Attack3"

@export var player : CharacterBody2D
@onready var timer : Timer = $Timer



func enter():
	# This is a base case for when we press jump
	print("You are attacking")
	
func exit():
	# This is a base case for when we land
	print("You exited attacking")
	
func state_input(event : InputEvent):
	if(event.is_action_pressed("Attack")):
		timer.start()
		

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_one):
		if(timer.is_stopped()):
			Transitioned.emit(self, "Ground")
			playback.travel("Move")
		else:
			playback.travel(attack_two)
	if(anim_name == attack_two):
		Transitioned.emit(self, "Ground")
		playback.travel("Move")
