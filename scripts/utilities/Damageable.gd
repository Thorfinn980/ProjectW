extends State
class_name Damageable

@export var health : float = 50
var isDead = false


func hit(damage : int):
	health -= damage
	if health <= 0:
		isDead = true
		Transitioned.emit(self, "Death")


func _process(delta):
	var x = get_parent().name
	#print(x + str(health))
