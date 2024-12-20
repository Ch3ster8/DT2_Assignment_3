extends Node
class_name Movement
const speed = 4.5
var nav_reg : NavigationRegion3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var nav_agent : NavigationAgent3D
@onready var player_node := get_tree().get_first_node_in_group("player_group")
var map_loaded = false

func _ready() -> void:
	nav_reg = get_tree().get_first_node_in_group("navigation_reg")
	await get_tree().physics_frame
	await get_tree().physics_frame
	map_loaded = true
func move(body, direction, delta):
	if !body.is_on_floor():
		body.velocity.y -= gravity * delta
	body.look_at(-body.velocity * 1000)
	direction = direction.normalized()
	if direction:
		body.velocity.x = direction.x * speed
		body.velocity.z = direction.z * speed
	else:
		body.velocity.x = 0
		body.velocity.z = 0
	body.move_and_slide()

func move_to(body, target, delta):
	if map_loaded:
		nav_agent.target_position = target
		var direction = nav_agent.get_next_path_position() - body.global_position
		move(body, direction, delta)

func move_to_player(body, delta):
	move_to(body, player_node.global_position, delta)
