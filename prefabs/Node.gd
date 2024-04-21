extends State
class_name PlayerBlock

signal block_active

func enter():
	print("You are blocking")
	emit_signal("block_active", true)

	#Blocking.set_visible(true)
	
func exit():
	print("You exited blocking")
	emit_signal("block_active", false)
	#$Blocking.visible = false
	
	
	
func state_input(event : InputEvent):
	if(event.is_action_pressed("Block")):
		enter()
	if(event.is_action_released("Block")):
		Transitioned.emit(self, "Ground")
		exit()
