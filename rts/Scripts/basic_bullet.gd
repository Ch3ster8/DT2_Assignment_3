extends Area2D
var speed
var range
var start
func _enter_tree():
	start = position

func _physics_process(delta):
	position.y -= speed * delta
	if position.distance_to(start) > range:
		queue_free()
