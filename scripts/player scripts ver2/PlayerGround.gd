extends State
class_name PlayerGround

@export var player : CharacterBody2D
@onready var anim_tree : AnimationTree = $"../../AnimationTree"
var delta_roll
var IsRolling = false
var is_dead = false

signal on_roll()

func enter():
	print("You are running")

func state_process (delta: float):
	if is_dead:
		Transitioned.emit(self,"Death")

func state_physics_process (delta: float):
	delta_roll = delta
	#print(player.roll_direction)
	if(!player.is_on_floor()):
		Transitioned.emit(self,"Air")

signal attack_audio

func state_input(event : InputEvent):
	if(event.is_action_pressed("Roll")):
		roll(delta_roll)
	if(event.is_action_pressed("Jump")):
		jump()
	if(event.is_action_pressed("Attack")):
		emit_signal("attack_audio")
		attack()
	if(event.is_action_pressed("Block")):
		block()
	
func jump():
	player.velocity.y = player.JUMP_VELOCITY
	Transitioned.emit(self,"Air")
	playback.travel("Jump")

func roll(delta_roll):
	emit_signal("on_roll")
	playback.travel("Roll")

func attack():
	Transitioned.emit(self, "Attack")
	playback.travel("Attack1")

func block():
	Transitioned.emit(self, "Block")
	print("block")

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "Roll"):
		playback.travel("Move")


func _on_damageable_character_dead(IsDead):
	is_dead = IsDead
