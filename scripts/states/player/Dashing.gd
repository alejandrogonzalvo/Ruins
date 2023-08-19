extends PlayerState

class_name PlayerDashing

var timer: Timer = Timer.new()


func _ready():
	timer.one_shot = true
	self.add_child(timer, false, Node.INTERNAL_MODE_FRONT)


func enter(_from: State = null):
	player.dash_ready = false
	timer.start(player.dash_duration)


func exit(_to: State = null):
	timer.stop()


func process(_delta: float):
	if timer.is_stopped():
		if !player.is_on_floor():
			transition.emit(self, "falling")
		elif player.velocity.x == 0:
			transition.emit(self, "idle")
		elif Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
			transition.emit(self, "walking")


func physics_process(delta: float):
	if timer.is_stopped():
		player.update_x_velocity(0, player.dash_accel, delta)
		return
	
	player.update_x_velocity(player.dash_speed * player.direction, player.dash_accel, delta)
