extends state
@export var movement : Movement
@export var parent : CharacterBody3D
@export var sight_node : sight
@export var lost_sight_time : int
var can_see = false
var timer

func enter():
	can_see = true

func physics_update(delta):
	if Engine.get_physics_frames() % 4 == 0:
		if sight_node.check_sight():
			if timer:
				timer.time_left = lost_sight_time
		else:
			cant_see()
			if !can_see:
				emit_signal("change", "patrol")
		#To Debug time left
		'''if timer:
			print(timer.time_left)'''
	movement.move_to_player(parent, delta)

func cant_see():
	if can_see == true:
		if !timer:
			timer = get_tree().create_timer(lost_sight_time, false)
		await timer.timeout
		timer = null
		can_see = false
