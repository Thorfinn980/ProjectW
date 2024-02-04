extends StateV2

@export var boss : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Abstract func: upon entering, execute code within
func enter():
	print("Boss1 is idling")
	pass

# Abstract func: upon enxiting, execute code within
func exit():
	print("Boss1 exiting idling")
	pass

# similar to _process but for states, render everything except for physics.
func state_process(_delta: float):
	pass

# similar to _physics_process but for states, render physics except for everything.
func state_physics_process (_delta: float):
	pass


func _on_detection_zone_body_entered(body):
	#TODO playerV2 name will probably be changed.
	if(body.name == "PlayerV2"):
		Transitioned.emit(self, "Chasing")
