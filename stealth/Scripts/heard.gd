extends state
@export var alert_time : int
@export var seethrough : Node3D
@export var alert : Sprite3D
@export var sight_node : sight
var timer : SceneTreeTimer

func enter():
	emit_signal("change", "search")
	alert.visible = true
	timer = get_tree().create_timer(alert_time, false)
	while timer.time_left > 0:
		if Engine.get_physics_frames() % 4 == 0:
			if !sight_node.check_sight_unrestricted():
				seethrough.visible = true
			else:
				seethrough.visible = false
		await get_tree().create_timer(0.01, false).timeout
	alert.visible = false
	seethrough.visible = false
