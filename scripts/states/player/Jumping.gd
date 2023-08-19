extends PlayerState

class_name PlayerJumping

var current_time: float = 0

func enter(_from: State = null):
	current_time = player.jump_time
	
func exit(_to: State = null):
	current_time = 0

func physics_process(delta):
	if Input.is_action_pressed("jump") && current_time > 0:
		print_debug(current_time)
		current_time -= delta
		player.velocity.y = -player.jump_force
	elif !Input.is_action_pressed("jump"):
		player.velocity.y = 0;
		transition.emit(self, "idle")
	else:
		player.velocity.y = player.jump_force
	
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -player.walking_speed
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = player.walking_speed
	else:
		player.velocity.x = 0
	
	player.move_and_slide()
