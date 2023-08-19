extends PlayerState
class_name PlayerIdle

func process(delta: float):
	if Input.is_action_pressed("dash"):
		transition.emit(self, "dashing")
#	elif Input.is_action_pressed("jump"):
#		transition.emit(self,"jumping")
	elif Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		transition.emit(self, "walking")
