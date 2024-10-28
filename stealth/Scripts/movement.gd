extends Node
class_name Movement
const speed = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var nav_agent : NavigationAgent3D


	
func move(body, direction, delta):
	if !body.is_on_floor():
		body.velocity.y -= gravity * delta
	direction = direction.normalized()
	if direction:
		body.velocity.x = direction.x * speed
		body.velocity.z = direction.z * speed
	else:
		body.velocity.x = 0
		body.velocity.z = 0
	body.move_and_slide()

func move_to(body, target, delta):
	nav_agent.target_position = target
	var direction = nav_agent.get_next_path_position() - body.global_position
	move(body, direction, delta)
