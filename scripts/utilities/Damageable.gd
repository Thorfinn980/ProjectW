extends Node
class_name Damageable

@export var health : float = 50

func hit(damage : int):
	health -= damage
	if health <= 0:
		get_parent().queue_free()

func _process(delta):
	var x = get_parent().name
	print(x + str(health))
