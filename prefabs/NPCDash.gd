extends State
class_name NPCDash

@onready var player = owner.get_parent().find_child("Player")
@export var goblin : CharacterBody2D
var player_entered = false

func enter():
	print("IsDash")
	playback.travel("dash_attack")



func dash():
	var tween = create_tween()
	tween.tween_property(owner, "position", player.position, 0.8)
	await tween.finished
	Transitioned.emit(self,"Idle")

