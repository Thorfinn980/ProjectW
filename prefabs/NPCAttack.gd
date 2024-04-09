extends State
class_name NPCAttack

@export var goblin : CharacterBody2D
var has_attack = false

signal attack_direction(attacking)
signal walk_speed(new_speed)
signal impulse_attack(force_push)


func enter():
	# This is a base case for when we press jump
	emit_signal("attack_direction", true)
	emit_signal("walk_speed", 0)
	emit_signal("impulse_attack", 10)
	playback.travel("attack_1")
	print("isAttack")

#func exit():
	#print("You exited attacking")
#func state_physics_process():


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "attack_1":
		Transitioned.emit(self,"Idle")
		emit_signal("attack_direction", false)
