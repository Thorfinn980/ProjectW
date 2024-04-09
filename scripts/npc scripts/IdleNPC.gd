extends NPCState
 
@onready var collision = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar = owner.find_child("ProgressBar")
var playback = null
 
 
var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
 
func _ready():
	playback = owner.get_node("AnimationTree").get("parameters/StateMachine/playback")

func enter():
	print("idle")
	super.enter()
	#animation_player.play("idle")
	playback.travel("idle")
 
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		player_entered = true
 
func transition():
	print("true")
	if player_entered:
		print("true")
		get_parent().change_state("Follow")
