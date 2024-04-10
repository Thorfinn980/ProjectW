extends State
class_name NPCAttack

@onready var player = owner.get_parent().find_child("Player")
@export var goblin : CharacterBody2D
var impulse_strength = Vector2(100, 1000)


signal attack_direction(attacking)
signal walk_speed(new_speed)

func enter():
	# This is a base case for when we press jump
	emit_signal("attack_direction", true)
	emit_signal("walk_speed", 0)
	var chance = randi() % 3
	dash()
	match chance:
		0:
			playback.travel("attack_1")
		1:
			playback.travel("attack_2")
		2:
			playback.travel("attack_3")

func dash():
	var tween = create_tween()
	tween.tween_property(owner, "position", player.position, 0.2)

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "attack_1":
		Transitioned.emit(self,"Idle")
		emit_signal("attack_direction", false)
	if anim_name == "attack_2":
		Transitioned.emit(self,"Idle")
		emit_signal("attack_direction", false)
	if anim_name == "attack_3":
		Transitioned.emit(self,"Idle")
		emit_signal("attack_direction", false)
