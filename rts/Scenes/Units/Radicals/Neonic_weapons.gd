extends Node
@export var left : Node2D
@export var right: Node2D
@export var middle : Node2D
var tick : int
@onready var parent := owner as stats
var can_shoot = true
func _process(_delta):
	if Input.is_action_just_pressed("left_mouse"):
		fire()
func fire():
	if can_shoot:
		can_shoot = false
		if tick != 7:
			if tick % 2 == 0:
				left.fire()
			elif tick % 2 == 1:
				right.fire()
			tick += 1
		else:
			middle.fire()
			tick = 0
		await get_tree().create_timer(parent.firerate, false).timeout
		can_shoot = true
	
