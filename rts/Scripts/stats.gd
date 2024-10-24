extends CharacterBody2D
class_name stats
@export var type : String
@export var damage : int
@export var speed : int
@export var firerate : float
@export var _range : int
@export var flying : bool
@export var hit_flying : bool
@export var pathfinding : PathFinding
var nav

func move_to(position):
	nav = position
	print(str(nav) + "nav")
	

func _physics_process(delta):
	if nav:
		pathfinding.Navigate(nav, self)
