extends Node2D

signal button

func _on_button_pressed():
	emit_signal("button")
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/Home.tscn")
