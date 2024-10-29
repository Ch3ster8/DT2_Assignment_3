extends state
@export var alert_time : int

func enter():
	await get_tree().create_timer(alert_time, false).timeout
	emit_signal("change", "hunt")
