extends StateV2

@export var boss : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
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
	if not boss.is_on_floor():
		Transitioned.emit(self, "Air")
	pass


func _on_detection_zone_body_entered(body):
	#TODO playerV2 name will probably be changed.
	if(body.name == "PlayerV2"):
		boss.isChasing = true
		Transitioned.emit(self, "Chasing")
