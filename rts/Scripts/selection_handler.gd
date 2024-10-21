extends Area2D
var selected := []
func _process(delta):
	global_position = get_global_mouse_position()

func _physics_process(delta):
	monitorable = false
	monitoring = false
	if Input.is_action_just_released("left_mouse"):
		monitorable = true
		monitoring = true
		await get_tree().physics_frame
		if has_overlapping_areas():
			if Input.is_action_pressed("multi_select"):
				for area in get_overlapping_areas():
					if !selected.has(area):
						selected.append(area)
			else:
				selected.clear()
				selected.append(get_overlapping_areas()[-1])
		else:
			selected.clear()
		print(selected)
