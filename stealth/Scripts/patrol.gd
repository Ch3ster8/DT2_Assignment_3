extends state
@export var patrol_group : String
@export var movement : Movement
@export var parent : CharacterBody3D
@export var sight_node : sight
@export var hearing_node : hearing
var cur_point
var points

func start():
	points = get_tree().get_nodes_in_group(patrol_group)
	cur_point = points[0]
	
func physics_update(_delta):
	hearing_node.check_hearing()
	if cur_point:
		var pos = parent.global_position
		if pos.distance_to(cur_point.global_position) < 1:
			var index = points.find(cur_point)
			if points.size() > index+1:
				cur_point = points[index +1]
			else:
				cur_point = points[0]
		movement.move_to(parent, cur_point.global_position, _delta)
	if Engine.get_physics_frames() % 4 == 0:
		if sight_node.check_sight():
			emit_signal("change", "seen")
		elif hearing_node.check_hearing():
			emit_signal("change", "heard")
			
			
			
