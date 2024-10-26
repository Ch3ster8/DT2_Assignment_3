extends state
@export var patrol_group : String
@export var movement : Movement
@export var parent : CharacterBody3D
var cur_point
var points

func start():
	points = get_tree().get_nodes_in_group(patrol_group)
	cur_point = points[0]
	
	
func physcis_update(_delta):
	if cur_point:
		print(cur_point)
		var pos = parent.global_position
		if pos.distance_to(cur_point.global_position) > 10:
			print(pos.distance_to(cur_point.global_position))
			print(cur_point.global_position)
			movement.move(parent, pos.direction_to(cur_point.global_position), _delta)
		else:
			var index = points.find(cur_point)
			if points.size() > index:
				cur_point = points[index +1]
			else:
				cur_point = points[0]
			
			
			
