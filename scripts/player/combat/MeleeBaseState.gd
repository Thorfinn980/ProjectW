extends StateV2
class_name MeleeBaseState

@export var player : CharacterBody2D

var duration: float
var should_combo: bool
var attack_index: int

func state_process(delta: float):
	if Input.is_action_just_pressed("Attack"):
		should_combo = true
