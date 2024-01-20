extends Node

#-------------------------------------------------------------------------------
# "STATE MACHINE" CLASS
#-------------------------------------------------------------------------------

# Initial state setup
@export var initial_state : StateV2

var current_state : StateV2
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is StateV2:
			# Any time we register a new state we connect the transitions
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		current_state.state_process (delta)

func _physics_process(delta):
	if current_state:
		current_state.state_physics_process(delta)

# Transition function
# Checks for oddities as well
func on_child_transition(state, new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
