extends State
class_name NPCDash

@onready var player = owner.get_parent().find_child("Player")
@export var goblin : CharacterBody2D
var player_entered = false

func enter():
	playback.travel("dash_attack")
	dash()

func dash():
	var tween = create_tween()
	tween.tween_property(owner, "position", player.position, 0.8)

func _on_animation_tree_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "dash_attack":
		Transitioned.emit(self,"Run")
