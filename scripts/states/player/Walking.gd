extends PlayerState

class_name PlayerWalking


func physics_process(_delta):
	if Input.is_action_pressed("jump"):
		transition.emit(self, "jumping")
		return
		
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -player.walking_speed
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = player.walking_speed
	else:
		player.velocity.x = 0
		transition.emit(self, "idle")
	
	player.move_and_slide()
