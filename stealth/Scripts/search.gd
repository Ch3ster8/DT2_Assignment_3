extends state
@export var movement : Movement
@export var parent : CharacterBody3D
@export var sight_node : sight
@export var hearing_node : hearing

func physics_update(delta: float) -> void:
	if Engine.get_physics_frames() % 4 == 0:
		hearing_node.check_hearing()
		if sight_node.check_sight():
			emit_signal("change", "seen")
	if hearing_node.last_heard():
		movement.move_to(parent, hearing_node.last_heard(), delta)
	var pos = parent.global_position
	if pos.distance_to(hearing_node.last_heard()) < 1:
		emit_signal("change", "patrol")
	
		
	
