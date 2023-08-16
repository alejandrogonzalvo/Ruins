extends Node2D
class_name Transition

var initial_state: State
var final_state: State
var transition_function

func _init(initial_state: State, final_state: State, transition_function):
	self.initial_state = initial_state
	self.final_state = final_state
	self.transition_function = transition_function


func check() -> bool:
	return transition_function.call()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
