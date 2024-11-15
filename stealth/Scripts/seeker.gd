extends CharacterBody3D
@export var area : Area3D
	


func _on_area_3d_body_entered(body):
	if body is player:
		var vec = body.global_position - global_position
		var direction = vec.normalized()
		body.velocity += direction * 40
		body.move_and_slide()
