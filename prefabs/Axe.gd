extends Area2D

@export var damage : int = 10
@export var goblin : GoblinBoss
@export var facing_shape : FacingCollisionShape2D

func _ready():
	monitoring = false
	goblin.connect("facing_direction_changed", on_goblin_facing_direction_changed)

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage) + ".")

func on_goblin_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
		
	
