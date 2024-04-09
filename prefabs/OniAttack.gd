extends NPCState
 
func enter():
	super.enter()
	print("Attack")
	combo()
 
func attack(move = "1"):
	animation_player.play("attack_" + move)
	await animation_player.animation_finished
 
func combo():
	var move_set = ["1","2","3"]
	for i in move_set:
		await attack(i)
	combo()
 
func transition():
	print("Attack")
	if owner.direction.length() > 80:
		get_parent().change_state("Follow")
