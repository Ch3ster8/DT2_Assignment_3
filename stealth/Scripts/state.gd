extends Node
class_name state
signal change(new_state : String)

#This script is just a class that can be extended from, it exists purely to declare variables and a signal
func update(_delta):
	pass
	
func physics_update(_delta):
	pass

func start():
	pass

func enter():
	pass
	
func leave():
	pass
	
#Removes a stupid warning, doesnt affect performance much because this function doesn't get called
func disapear_annoying_warning():
	var whatever = change.get_name()
	whatever.ends_with("e")
