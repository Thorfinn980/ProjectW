extends State
class_name EnemyIdle

var move_direction: Vector2
@export var move_speed := 40.0
@onready var collision = $"../../PlayerDetection/CollisionShape2D"

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)

func _physics_process (_delta: float):
	if player_entered:
		Transitioned.emit(self, "Follow")
		playback.travel("move")

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		print("Player")
	print(body.name)
	player_entered = true
	print(player_entered)
