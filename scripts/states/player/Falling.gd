extends PlayerState

class_name PlayerFalling


func process(_delta: float):
	if Input.is_action_pressed("dash") && player.dash_ready:
		transition.emit(self, "dashing")
	elif player.is_on_floor():
		player.velocity.y = 0
		if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
			transition.emit(self, "walking")
		elif player.velocity.x == 0:
			transition.emit(self, "idle")


func physics_process(delta: float):
	var direction = player.get_movement_direction()
	player.update_x_velocity(player.airborn_speed * direction, player.airborn_accel, delta)
	
	player.velocity.y += player.fall_accel * delta
	if player.velocity.y > player.fall_speed:
		player.velocity.y = player.fall_speed
