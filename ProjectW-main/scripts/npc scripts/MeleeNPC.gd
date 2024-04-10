extends State
 
@onready var anim_tree : AnimationTree = $"../../AnimationTree"

func enter():
	super.enter()
	#animation_player.play("melee_attack")
	#
 
func transition():
	if owner.direction.length() > 30:
		get_parent().change_state("Follow")
 
