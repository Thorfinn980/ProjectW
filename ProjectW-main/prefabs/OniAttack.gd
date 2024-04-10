extends State
class_name EnemyAttack

@onready var FinishTimer: Timer = $FinishTimer
@onready var HitTimer: Timer = $HitTimer
@export var Hitbox: Area2D

func enter():
	print("isAttacking")
	#owner.anim_player.play("attack")
	playback.travel("attack")
	#HitTimer.start()
	#FinishTimer.start()

#func state_process(_delta):
	#if owner.direction.length() > 70:
		#Transitioned.emit(self, "Follow")


## check if player in hitbox
#func _on_hit_timer_timeout():
	#Hitbox.do_some_damage()
#
#
#func finish_timer():
	#Transitioned.emit(self , "Follow")
	#playback.travel("move")


func _on_attack_range_body_exited(body):
	Transitioned.emit(self, "Follow")
	playback.travel("move")
