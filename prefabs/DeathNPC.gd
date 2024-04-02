extends State

@onready var anim_tree : AnimationTree = $"../../AnimationTree" 

func enter():
	super.enter()
	#animation_player.play("death")
	#await animation_player.animation_finished
	#animation_player.play("boss_slained")
