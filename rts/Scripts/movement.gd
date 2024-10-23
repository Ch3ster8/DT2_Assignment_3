extends Node
class_name Movement
var velocity : Vector2
@export var speed = 500
@export var acceleration = 15.0
@export var deceleration = 10.0
@export var canMove = true
#Ticks the dashTimer down if it's above 0;
#if its below 0 then decelerate the dash
func _physics_process(_delta):
		if !canMove:
			Decelerate()
#Decelerates the velocity by moving it towards 0 by the deceleration time;
#also makes sure the velocity is capped at the speed
func Decelerate():
	if (velocity.x > speed):
		velocity.x = speed
	if (velocity.y > speed):
		velocity.y = speed
	velocity = velocity.normalized()
	velocity.x = move_toward(velocity.x, 0, deceleration)
	velocity.y = move_toward(velocity.y, 0, deceleration)

#Takes an input of a direction and changes this scripts velocity;
#to move towards the inputed direction by the acceleration time.
#If there is no inputed direction then the velocity will Decelerate
func MoveTowards(direction : Vector2):
	if direction != Vector2.ZERO && canMove:
		direction = direction.normalized()
		velocity.x = move_toward(velocity.x, direction.x*speed, acceleration)
		velocity.y = move_toward(velocity.y, direction.y*speed, acceleration)
	else:
		Decelerate()
		
func Knockback(direction : Vector2, strength : float):
	velocity += direction * strength
		
#Moves the body towards this scripts velocity var
func Move(body : CharacterBody2D):
	body.velocity = velocity
	body.move_and_slide()
