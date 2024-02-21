extends State

@export var landing_animation_name : String = "JumpEnd"
@export var ground_state : State

func enter():
	print("You are falling")

func _on_animation_tree_animation_finished(anim_name):
	print(anim_name)
	if(anim_name == landing_animation_name):
		Transitioned.emit(self,"Ground")
