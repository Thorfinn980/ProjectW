extends State
class_name PlayerGround

@export var jump_anim : String = "Jump"
@export var attack_animation : String = "Attack1"

func enter():
	print("You are running")

func state_physics_process (delta: float):
	if(!player.is_on_floor()):
		Transitioned.emit(self,"Air")

func state_input(event : InputEvent):
	if(event.is_action_pressed("Roll")):
		roll()
	if(event.is_action_pressed("Jump")):
		jump()
	if(event.is_action_pressed("Attack")):
		attack()

func jump():
	player.velocity.y = player.JUMP_VELOCITY
	Transitioned.emit(self,"Air")
	playback.travel(jump_anim)

func roll():
	player.velocity.y = 500
	player.velocity.x = player.SpriteDirection * player.ROLL_VELOCITY
	playback.travel("Roll")

func attack():
	Transitioned.emit(self, "Attack")
	playback.travel(attack_animation)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "Roll"):
		playback.travel("Move")
