extends PlayerState
class_name PlayerIdle

func physics_process(_delta):
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		transition.emit(self, "walking")
	if Input.is_action_pressed("jump"):
		transition.emit(self, "jumping")
