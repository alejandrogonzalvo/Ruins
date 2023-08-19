extends PlayerState

class_name PlayerWalking

func process(_delta):
	if Input.is_action_pressed("dash"):
		transition.emit(self, "dashing")
	elif player.velocity.x == 0:
		transition.emit(self, "idle")
	

func physics_process(delta):
	var target_velocity = player.walk_speed
	if Input.is_action_pressed("move_left"):
		player.direction = player.Direction.LEFT
	elif Input.is_action_pressed("move_right"):
		player.direction = player.Direction.RIGHT
	else:
		target_velocity = 0
	target_velocity *= player.direction
	
	player.update_x_velocity(target_velocity, player.walk_accel, delta)
