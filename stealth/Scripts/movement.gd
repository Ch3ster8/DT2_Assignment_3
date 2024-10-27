extends Node
class_name Movement
const speed = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


	
func move(body, direction, delta):
	if !body.is_on_floor():
		body.velocity.y -= gravity * delta
	direction = Vector3(direction.x, 0, direction.y).normalized()
	if direction:
		print(direction)
		body.velocity.x = direction.x * speed
		body.velocity.z = direction.z * speed
	else:
		body.velocity.x = 0
		body.velocity.z = 0
	body.move_and_slide()
