extends Area2D

@export var damage : int = 10

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage) + ".")



func _on_player_change_sword_direction(direction):
	if direction:
		#right
		scale.x = -1
	else:
		scale.x = 1
