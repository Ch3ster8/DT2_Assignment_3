extends state
@export var movement : Movement
@export var parent : CharacterBody3D
@export var sight : RayCast3D
var can_see = false
var timer
func enter():
	can_see = true
func physics_update(delta):
	if !sight.is_colliding():
		cant_see()
		if !can_see:
			emit_signal("change", "patrol")
	else:
		if !sight.get_collider() is player:
			cant_see()
			if !can_see:
				emit_signal("change", "patrol")
		else:
			if timer:
				timer.time_left = 15
	movement.move_to_player(parent, delta)
	#To Debug time left
	'''if timer:
		print(timer.time_left)'''

func cant_see():
	if can_see == true:
		if !timer:
			timer = get_tree().create_timer(15, false)
		await timer.timeout
		timer = null
		can_see = false
