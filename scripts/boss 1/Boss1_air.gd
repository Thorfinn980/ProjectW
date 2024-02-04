extends StateV2

@export var boss : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Abstract func: upon entering, execute code within
func enter():
	print("Boss1 is in air")
	pass

# Abstract func: upon enxiting, execute code within
func exit():
	print("Boss1 exiting air")
	pass

# similar to _process but for states, render everything except for physics.
func state_process(_delta: float):
	pass

# similar to _physics_process but for states, render physics except for everything.
func state_physics_process (_delta: float):
	if boss.is_on_floor() && boss.isChasing:
		Transitioned.emit(self, "Chasing")
	elif boss.is_on_floor() && not boss.isChasing:
		Transitioned.emit(self, "Idle")
	pass
