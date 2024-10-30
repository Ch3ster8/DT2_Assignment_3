extends Node
class_name state
signal change(new_state : String)

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
func disapear_annoying_warning():
	var whatever = change.get_name()
	whatever.ends_with("e")
