extends StateV2

@export var boss : CharacterBody2D
var cooldown

func enter():
	print("Boss1 is attacking")
	cooldown = get_node("Cooldown")
	boss.anim.play("Attack1")

	cooldown.start()
	#Transitioned.emit(self, "Chasing")
	
func exit():
	print("Boss1 is exiting attacking")

func _process(delta):
	boss.anim.play("Idle")
	Transitioned.emit(self, "Chasing")
