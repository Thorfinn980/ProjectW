extends State
class_name EnemyIdle

@onready var collision = $"../../PlayerDetection/CollisionShape2D"
@export var enemy : CharacterBody2D

func enter():
	print("isIdle")

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		#animation_player.play("idle")

func state_process (_delta: float):
	if player_entered:
		Transitioned.emit(self, "Follow")
		

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		print("Player")
		print(body.name)
		player_entered = true
