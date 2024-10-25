extends Area2D
class_name PathFinding
@onready var nav_agent = $NavigationAgent2D
@onready var parent := owner as CharacterBody2D
@export var movement : Movement
@export var turn_power = 0.8
var cooldown = 0.5
var timer = 0
var last_dir
var first_position

#Each cardinal direction
var directions = [Vector2(0,1), Vector2(1,1), Vector2(1,0), Vector2(1,-1), Vector2(0,-1), Vector2(-1,-1), Vector2(-1,0), Vector2(-1,1)]
#Empty arrays
var raycasts = []
var interests = [Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0), Vector2(0,0)]
var dangers = [0,0,0,0,0,0,0,0]
var direction 

#Add all the raycasts under this node to a list
func _ready():
	for x in get_children():
		if x is RayCast2D:
			raycasts.append(x)
	first_position = global_position
func _process(delta):
	if timer > 0:
		timer -= delta

func Navigate(interest : Vector2, object):
	if parent.position.distance_to(interest) > 30:
		#Getting the direction to the player
		nav_agent.target_position = interest
		get_next_dir()
		
		dangers = [0,0,0,0,0,0,0,0]
		check_dangers()
		check_interests()
		#Moving the enemy using the movement controller
		movement.MoveTowards(get_final_dir())
		object.look_at(object.velocity)
		
		
		#Checks if an ally unit has the same movement command and if they have and we are colliding with it;
		#And they have reached their destination then that means we have also reached our destination
		for x in raycasts.size():
			if raycasts[x].is_colliding():
				var collider = raycasts[x].get_collider()
				if !collider is CharacterBody2D:
					collider = raycasts[x].get_collider().owner
				if collider is CharacterBody2D:
					if Mouse.selected.has(collider):
						if collider.nav == null:
							movement.Decelerate()
							object.nav = null
							return
	else:
		object.nav = null
		movement.Decelerate()
	movement.Move(parent)
	
func get_next_dir():
	#Gets the direction to the target position
	direction = nav_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
func check_dangers():
	#Looping through the raycasts to see if we are near anything and adding the value 6 in the direction we are colliding
	for x in raycasts.size():
		if raycasts[x-2].is_colliding():
			dangers[x] = 6
	print(dangers)
			


func check_interests():
	for x in directions.size():
		interests[x] = directions[x].dot(direction)
	#looping through the interests to minus the dangers, the largest value after this step is the direction we will move in
	for x in interests.size():
		interests[x] -= dangers[x]
		if interests[x] < 0:
			interests[x] = 0
func get_final_dir():
	#Getting the final direction
	var finalDirection = Vector2.ZERO
	for x in interests.size():
		finalDirection += directions[x] * interests[x]
	#Making the final direction rounded by the steering power variable
	var steering_direction = finalDirection - movement.velocity
	finalDirection = movement.velocity + steering_direction * turn_power
	return finalDirection.normalized()

#For random movement if needed
func randomDir():
	if timer <= 0:
		timer = cooldown
		last_dir = Vector2(randi_range(-1, 1), randi_range(-1, 1))
		if global_position.distance_to(first_position) > 50:
			return global_position.direction_to(first_position)
		else:
			return last_dir
	else:
		return last_dir
