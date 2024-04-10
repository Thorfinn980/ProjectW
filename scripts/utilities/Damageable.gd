extends State
class_name Damageable

signal character_dead(IsDead)
signal update_bar()

@export var health : float = 50

func hit(damage : int):
	health -= damage
	emit_signal("update_bar")
	
	if health <= 0:
		Transitioned.emit(self, "Death")

func _process(delta):
	var x = get_parent().name
	print(x + str(health))
	if health <= 0:
		emit_signal("character_dead", true)

