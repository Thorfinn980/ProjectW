extends Node2D
 
var current_state: NPCState
var previous_state: NPCState
@export var anim_tree : AnimationTree
 
func _ready():
	current_state = get_child(0) as NPCState
	previous_state = current_state
	current_state.enter()
 
func change_state(state):
	current_state = find_child(state) as NPCState
	current_state.enter()
 
	previous_state.exit()
	previous_state = current_state
