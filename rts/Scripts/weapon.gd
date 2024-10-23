extends Node2D
@export var bullet : PackedScene
@onready var parent := owner as stats
@export var damage_mod : int
@export var bullet_speed : int
@export var bullet_scale : float

func fire():
	var instance = bullet.instantiate()
	instance.speed = bullet_speed
	instance._range = parent._range
	instance.scale = Vector2(bullet_scale, bullet_scale)
	add_child(instance)
	if get_child_count() > 50:
		get_child(-1).queue_free()
