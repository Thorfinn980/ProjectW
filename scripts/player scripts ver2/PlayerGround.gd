extends State
class_name PlayerGround

@export var player : CharacterBody2D
@onready var anim_tree : AnimationTree = $"../../AnimationTree"
var delta_roll
var IsRolling = false

signal player_roll()

func enter():
	print("You are running")

func state_physics_process (delta: float):
	delta_roll = delta
	#print(player.roll_direction)
	if(!player.is_on_floor()):
		Transitioned.emit(self,"Air")

func state_input(event : InputEvent):
	if(event.is_action_pressed("Roll")):
		#anim_tree.set("parameters/TimeScale/scale", 2.0)
		roll(delta_roll)
	if(event.is_action_pressed("Jump")):
		jump()
	if(event.is_action_pressed("Attack")):
		attack()
	
func jump():
	player.velocity.y = player.JUMP_VELOCITY
	Transitioned.emit(self,"Air")
	playback.travel("Jump")

func roll(delta_roll):
	emit_signal("player_roll", delta_roll)
	#player.velocity.x = player.roll_direction * player.ROLL_VELOCITY
	playback.travel("Roll")

func attack():
	Transitioned.emit(self, "Attack")
	playback.travel("Attack1")

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "Roll"):
		playback.travel("Move")
