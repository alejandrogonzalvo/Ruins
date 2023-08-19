extends PlayerState

class_name PlayerWalking


func process(_delta):
	if !player.is_on_floor():
		transition.emit(self, "falling")
	elif Input.is_action_pressed("dash") && player.dash_ready:
		transition.emit(self, "dashing")
	elif Input.is_action_pressed("jump") && player.jump_ready:
		transition.emit(self, "jumping")
	elif player.velocity.x == 0:
		transition.emit(self, "idle")


func physics_process(delta):
	var direction = player.get_movement_direction()
	player.update_x_velocity(player.walk_speed * direction, player.walk_accel, delta)
