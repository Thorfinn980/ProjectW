extends RichTextLabel


func _on_damageable_player_dam():
	
	text = "-10"
	show()
	await get_tree().create_timer(0.5).timeout
	hide()
