extends Area2D
var selected := []
func _process(_delta):
	global_position = get_global_mouse_position()

func _physics_process(delta):
	monitoring = false
	if Input.is_action_just_released("left_mouse"):
		monitoring = true
		await get_tree().physics_frame
		if has_overlapping_bodies():
			if Input.is_action_pressed("multi_select"):
				for unit in get_overlapping_bodies():
					if !selected.has(unit):
						selected.append(unit as stats)
			else:
				selected.clear()
				selected.append(get_overlapping_bodies()[-1])
		else:
			selected.clear()
	elif Input.is_action_just_pressed("right_mouse"):
		if selected.size() > 0:
			for unit in selected:
				unit.move_to(get_global_mouse_position())
