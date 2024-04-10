extends Node
class_name State

#-------------------------------------------------------------------------------
# ABSTRACT CLASS
#-------------------------------------------------------------------------------

# To leave a state, call the signal
# Example: Transitioned.emit(self, "Run")
# 1) You must emit the node itself and the STATE NODE 
# 	 that you are intending to transition
signal Transitioned

@export var can_move : bool = true
var playback : AnimationNodeStateMachinePlayback
var next_state : State

# Abstract func: upon entering, execute code within
func enter():
	pass

# Abstract func: upon enxiting, execute code within
func exit():
	pass

func state_input(_event : InputEvent):
	pass

# similar to _process but for states, render everything except for physics.
func state_process(_delta: float):
	pass

# similar to _physics_process but for states, render physics except for everything.
func state_physics_process (_delta: float):
	pass
