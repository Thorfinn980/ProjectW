extends Node
class_name StateV2

#-------------------------------------------------------------------------------
# ABSTRACT CLASS
#-------------------------------------------------------------------------------

# To leave a state, call the signal
# Example: Transitioned.emit(self, "Run")
# 1) You must emit the node itself and the STATE NODE 
# 	 that you are intending to transition
signal Transitioned

# Abstract func: upon entering, execute code within
func enter():
	pass

# Abstract func: upon enxiting, execute code within
func exit():
	pass

# similar to _process but for states, render everything except for physics.
func state_process(_delta: float):
	pass

# similar to _physics_process but for states, render physics except for everything.
func state_physics_process (_delta: float):
	pass


func _on_detection_zone_body_exited(body):
	pass # Replace with function body.
