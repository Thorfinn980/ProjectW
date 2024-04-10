extends State
class_name NPCRun

@export var goblin : CharacterBody2D
var player_entered = false
signal walk_speed(new_speed)

func enter():
	print("isRun")
	playback.travel("run")
	emit_signal("walk_speed", 100)
	
func state_process(_delta):
	playback.travel("run")


func _on_attack_range_body_entered(body):
	Transitioned.emit(self, "Attack")
