extends Node2D
class_name StateMachine

var current_state: State
var transitions: Array[Transition]

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state.process_action.call()
	
	for transition in transitions:
		if transition.initial_state != current_state:
			continue
		
		if transition.check():
			change_state(transition.final_state)


func change_state(state: State) -> void:
	current_state.exit_action.call()
	current_state = state
	current_state.enter_action.call()

func add_state() -> void:
	pass
	
func add_transition(initial_state: State, final_state: State, transition_function) -> void :
	transitions.append(Transition.new(initial_state, final_state, transition_function))
