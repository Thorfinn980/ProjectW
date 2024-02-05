extends Node

var HP = 10: set = set_health, get = get_health 

signal HP_changed
signal died

func set_health(new_value: float):
	HP = new_value

func get_health():
	return HP

func take_damage(damage):
	set_health(HP-damage)
	if HP <= 0:
		die()

func die():
	# When emitting the signal
	# Allow for other scripts to make use of this
	emit_signal("died")
	
	# Thanos snap the character
	queue_free()
	
