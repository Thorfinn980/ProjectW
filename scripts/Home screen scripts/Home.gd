extends Node2D

#button sound effect signal
signal button_click

func _on_quit_pressed():
	emit_signal("button_click")
	#delay so the sound effect plays
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()


func _on_play_pressed():
	emit_signal("button_click")
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_how_to_pressed():
	emit_signal("button_click")
	await get_tree().create_timer(0.3).timeout
	
	get_tree().change_scene_to_file("res://scenes/howToPlay.tscn")
