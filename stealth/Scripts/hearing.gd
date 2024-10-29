extends Node3D
class_name hearing
var player_node : player
var last_pos : Vector3
func _ready():
	player_node = get_tree().get_first_node_in_group("player_group")
func check_hearing():
	if global_position.distance_to(player_node.global_position) <= player_node.sound_radius:
		last_pos = player_node.global_position
		return player_node.global_position
	return false

func last_heard():
	if last_pos:
		return last_pos
	return false
