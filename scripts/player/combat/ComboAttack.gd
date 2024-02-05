extends MeleeBaseState
class_name FinisherAttack
@onready var fixed_time = $"../../ComboTimer"

func enter():
	print("You are Cattacking")
	attack_index = 1
	duration = 0.5
	player.anim.play("Attack2")
	#fixed_time.start()

func exit():
	print("You are attacking")

func state_process(delta: float):
	#if fixed_time >= duration:
		if should_combo:
			Transitioned.emit(self, "FinisherAttack")
			#fixed_time.reset
		else:
			Transitioned.emit(self, "Idle") 
			#fixed_time.reset
