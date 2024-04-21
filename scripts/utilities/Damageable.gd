extends State
class_name Damageable

signal character_dead(IsDead)
signal update_bar()
signal hit_audio()
signal block_nodamage()

var is_blocking = false



@export var health : float = 50



func ready():
	var player_block = get_node("State Machine/Block")
	#if player_block:
		#player_block.connect("block_active", self, "on_block_active")

func _on_block_block_active(active):
	is_blocking = active
	if active:
		print("block")
	else:
		print("stop block")


func hit(damage : int):
		
	if is_blocking:
		print("player is blocking")
		emit_signal("block_nodamage")
	
	
	else:
		health -= damage
		print("player hit")
		emit_signal("update_bar")
		emit_signal("hit_audio")
		
		if health <= 0:
			Transitioned.emit(self, "Death")

func _process(delta):
	var x = get_parent().name
	print(x + str(health))
	if health <= 0:
		emit_signal("character_dead", true)

