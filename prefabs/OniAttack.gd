extends State
class_name EnemyAttack

@onready var FinishTimer: Timer = $FinishTimer
@onready var HitTimer: Timer = $HitTimer
@export var Hitbox: Area2D

func enter():
	print("Oni attacking")
	playback.travel("attack")
	HitTimer.start()
	FinishTimer.start()

# check if player in hitbox
func _on_hit_timer_timeout():
	Hitbox.damage()


func finish_timer():
	Transitioned.emit(self, "Follow")
	playback.travel("move")
