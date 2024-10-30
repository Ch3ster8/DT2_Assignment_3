extends Node3D
class_name sight
var player_node : player
func _ready():
	player_node = get_tree().get_first_node_in_group("player_group")
	
func check_sight_unrestricted():
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, player_node.global_position, 1)
	query.collide_with_bodies = true
	var result = space_state.intersect_ray(query)
	if result:
		if result["collider"] is player:
			DebugDraw3D.draw_line(global_position, player_node.global_position, Color(1, 0, 0))
			return true
	DebugDraw3D.draw_line(global_position, player_node.global_position, Color(0, 0, 1))
	return false
	
func check_sight():
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, player_node.global_position, 1)
	query.collide_with_bodies = true
	var result = space_state.intersect_ray(query)
	if result:
		var forward = global_transform.basis.z
		var direction = global_position.direction_to(player_node.global_position)
		var angle = rad_to_deg(forward.angle_to(direction))
		if angle <= 75 and angle >= 0 or angle <= 360 and angle >= 255:
			if result["collider"] is player:
				DebugDraw3D.draw_line(global_position, player_node.global_position, Color(1, 0, 0))
				return true
	DebugDraw3D.draw_line(global_position, player_node.global_position, Color(0, 0, 1))
	return false
