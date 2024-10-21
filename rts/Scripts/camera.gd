extends Camera2D
@export_range(0, 10) var sensitivity
@export_range(0, 1) var zoom_sensitivity
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "forward", "down")
	if direction:
		position += direction * sensitivity
	if Input.is_action_just_pressed("zoom_in"):
		if zoom.x < 5:
			zoom += Vector2(zoom_sensitivity, zoom_sensitivity)
	if Input.is_action_just_pressed("zoom_out"):
		if zoom.x != zoom_sensitivity:
			zoom -= Vector2(zoom_sensitivity, zoom_sensitivity)
