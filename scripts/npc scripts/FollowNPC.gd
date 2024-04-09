extends NPCState
 
var playback = null

func _enter_tree():
	randomize()
 
func enter():
	print("Follow")
	super.enter()
	owner.set_physics_process(true)
	#animation_player.play("idle")
	#playback.travel("idle")
	
 
func _ready():
	playback = owner.get_node("AnimationTree").get("parameters/StateMachine/playback")

func exit():
	super.exit()
	owner.set_physics_process(false)
 
func transition():
	animation_player.play("run")
	print("Run")
	
	if owner.direction.length() < 80:
		get_parent().change_state("Attack")
	#if owner.direction.length() > 150:
		#var chance = randi() % 2
		#match chance:
			#0:
				#print("test")
				###get_parent().change_state("SpawnMinion")
			#1:
				#print("test2")
				##get_parent().change_state("Teleport")
