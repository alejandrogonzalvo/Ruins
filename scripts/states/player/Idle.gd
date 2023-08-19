extends PlayerState

class_name PlayerIdle


func process(delta: float):
	if Input.is_action_pressed("dash") && player.dash_ready:
		transition.emit(self, "dashing")
	elif Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		transition.emit(self, "walking")
	elif !player.is_on_floor():
		transition.emit(self, "falling")
