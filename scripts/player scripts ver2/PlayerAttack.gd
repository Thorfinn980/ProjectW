extends StateV2
class_name PlayerAttack

@export var player : CharacterBody2D

func enter():
	# This is a base case for when we press jump
	print("You are attacking")
	
func exit():
	# This is a base case for when we land
	print("You exited attacking")
	
func state_physics_process (delta: float):
	
