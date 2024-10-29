extends state
@export var patrol_group : String
@export var movement : Movement
@export var parent : CharacterBody3D
@export var sight : RayCast3D
var cur_point
var points

func start():
	points = get_tree().get_nodes_in_group(patrol_group)
	cur_point = points[0]
	
	
func physics_update(_delta):
	if cur_point:
		var pos = parent.global_position
		if pos.distance_to(cur_point.global_position) < 1:
			var index = points.find(cur_point)
			if points.size() > index+1:
				cur_point = points[index +1]
			else:
				cur_point = points[0]
		movement.move_to(parent, cur_point.global_position, _delta)
	if sight.is_colliding():
		if sight.get_collider() is player:
			print("chanign")
			emit_signal("change", "hunt")
			
			
			
