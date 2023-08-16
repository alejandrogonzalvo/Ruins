extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_state_transition)
	
	if initial_state:
		current_state = initial_state
		
func _process(delta):
	if current_state:
		current_state.process(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_process(delta)

func on_state_transition(state: State, new_state_name: String):
	print_debug("change state from (%s) to (%s)" % [state, new_state_name])
	if state != current_state:
		print_debug("invalid state transition: state (\"%s\") is not the current state (\"%s\")" % [state, current_state])
		return
	
	var new_state: State = states.get(new_state_name.to_lower())
	if !new_state:
		print_debug("invalid state transition: target state not found (\"%s\" -> \"%s\")" % [state, new_state_name])
		return
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
