extends Area2D
var speed
var _range
var start
func _enter_tree():
	start = position

func _physics_process(delta):
	position.y -= speed * delta
	if position.distance_to(start) > _range:
		queue_free()
