extends State
class_name EnemyDeath

@onready var anim_tree : AnimationTree = $"../../AnimationTree" 

func enter():
	playback.travel("death")
	#await animation_player.animation_finished
	#animation_player.play("boss_slained")
