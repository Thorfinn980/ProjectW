extends StateV2
class_name PlayerHurt

@export var player : CharacterBody2D

func enter():
	# This is a base case for when we press jump
	print("You are hurt")

func exit():
	# This is a base case for when we land
	print("You exited hurt")

func state_physics_process (delta: float):
	pass
