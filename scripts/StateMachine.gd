extends Node2D
class_name StateMachine

var current_state: State
var transitions: Array

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for transition in transitions:
		(transition as Transition)
		if transition.initial_state != current_state:
			continue
		
		if transition.check():
			change_state(transition.final_state)


func change_state(state: State):
	current_state = state
