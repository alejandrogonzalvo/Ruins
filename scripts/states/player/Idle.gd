extends PlayerState
class_name PlayerIdle

func process(_delta):
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		transition.emit(self, "walking")
