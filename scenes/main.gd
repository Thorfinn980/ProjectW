extends Node2D



func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
