extends PlayerState

class_name PlayerJumping

var timer: Timer = Timer.new()


func _ready():
	timer.one_shot = true
	add_child(timer, false, Node.INTERNAL_MODE_FRONT)


func enter(_from: State = null):
	timer.start(player.jump_duration)


func exit(_to: State = null):
	timer.stop()


func process(_delta: float):
	if Input.is_action_pressed("dash") && player.dash_ready:
		transition.emit(self, "dashing")
	elif timer.is_stopped() || !Input.is_action_pressed("jump"):
		if !player.is_on_floor():
			transition.emit(self, "falling")
		elif Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
			transition.emit(self, "walking")
		elif player.velocity.x == 0:
			transition.emit(self, "idle")


func physics_process(delta: float):
	if timer.is_stopped():
		return
		
	var direction = player.get_movement_direction()
	player.update_x_velocity(player.airborn_speed * direction, player.airborn_accel, delta)
	
	player.velocity.y -= player.jump_accel * delta
	if player.velocity.y <= -player.jump_speed:
		player.velocity.y = -player.jump_speed
