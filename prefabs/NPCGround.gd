extends State
class_name NPCIdle

@export var goblin : CharacterBody2D
var player_entered = false
var is_body_inside = false


signal idle_speed(new_speed)

func enter():
	print("isWalk")
	emit_signal("idle_speed", 0)
	playback.travel("idle")

func state_process(_delta):
	if is_body_inside:
		Transitioned.emit(self, "Run")
	#if player_entered == true && owner.direction.length() > 80:
		#playback.travel("run")
	#elif player_entered == true && owner.direction.length() > 100:
		#dash()

func dash():
	Transitioned.emit(self,"Dash")

func attack():
	Transitioned.emit(self, "Attack")
	playback.travel("Attack1")

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		is_body_inside = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		is_body_inside = false

func _on_attack_range_body_entered(body):
	Transitioned.emit(self, "Attack")
