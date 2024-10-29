extends Node
var states = {}
var cur_state : state
@export var start_state : state

func _ready():
	for child in get_children():
		states[child.name.to_lower()] = child as state
		child.change.connect(change_state)
	print(states)
	cur_state = start_state
	cur_state.start()

func _process(delta):
	if cur_state:
		cur_state.update(delta)
func _physics_process(delta):
	if cur_state:
		cur_state.physics_update(delta)
		
func change_state(new_state_name : String):
	var new_state = states.get(new_state_name.to_lower())
	if new_state:
		if cur_state != new_state:
			cur_state.leave()
			cur_state = new_state
			cur_state.enter()
