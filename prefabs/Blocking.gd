extends RichTextLabel


func _on_damageable_block_nodamage():
	show()
	await get_tree().create_timer(1).timeout
	hide()
