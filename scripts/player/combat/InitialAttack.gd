extends MeleeBaseState
class_name InitialAttack
@onready var fixed_time = $"../../ComboTimer"



func enter():
	print("You are Iattacking")
	attack_index = 1
	duration = 0.5
	player.anim.play("Attack1")
	should_combo = true
	#fixed_time.start()

func exit():
	print("You are attacking")

func state_process(delta: float):
	#if fixed_time >= duration:
		if should_combo:
			Transitioned.emit(self, "ComboAttack")
			#fixed_time.reset()
		else:
			Transitioned.emit(self, "Idle")
			#fixed_time.reset
	
