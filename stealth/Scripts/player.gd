extends CharacterBody3D
class_name player
@export var speed = 7
@export var sensitivity = 0.005
@export var sound_amp = 15
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var sound_radius = speed * sound_amp

const bob_freq = 2
const bob_amp = 0.04
var t_bob = 0

@export var head : Node3D
@export var camera : Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))
func _physics_process(delta):
	if !is_on_floor():
		velocity.y -= gravity * delta
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		sound_radius = speed * sound_amp
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		sound_radius = 0
		velocity.x = 0
		velocity.z = 0
		
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = Headbob(t_bob)
	move_and_slide()
	
func Headbob(time):
	var pos = Vector3.ZERO
	pos.y = sin(time * bob_freq) * bob_amp
	#pos.x = cos(time * bob_freq) * bob_amp
	return pos
