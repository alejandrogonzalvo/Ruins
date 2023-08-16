extends PlayerState

class_name PlayerWalking

@export var speed: float = 10

func physics_process(_delta):
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -speed
		player.move_and_slide()
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = +speed
		player.move_and_slide()
	else:
		player.velocity.x = 0
		transition.emit(self, "idle")
