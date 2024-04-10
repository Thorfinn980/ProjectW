extends State
class_name NPCRun

@export var goblin : CharacterBody2D
var player_entered = false
var is_dead = false
signal walk_speed(new_speed)
signal dead_direction(dead)

func enter():
	print("isRun")
	playback.travel("run")
	emit_signal("walk_speed", 100)
	
func state_process(_delta):
	playback.travel("run")
	if is_dead:
		Transitioned.emit(self, "Death")
		emit_signal("walk_speed", 0)
		


func _on_attack_range_body_entered(body):
	Transitioned.emit(self, "Attack")


func _on_damageable_character_dead(IsDead):
	is_dead = IsDead
