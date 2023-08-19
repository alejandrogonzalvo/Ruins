extends CharacterBody2D
class_name MainPlayer

@export var direction: Direction = Direction.RIGHT
enum Direction {LEFT = -1, RIGHT = 1}

@export var walk_speed: float = 100
@export var walk_accel: float = 2000

var velocity_x_snap_threshold: float = 0.1

@export var dash_duration: float = 0.2
@export var dash_speed: float = 500
@export var dash_accel: float = 50000

func _physics_process(delta):
	self.move_and_slide()

func update_x_velocity(target: float, acceleration: float, delta: float):
	var current = self.velocity.x
	if abs(current - target) < velocity_x_snap_threshold:
		self.velocity.x = target
		return
	
	var change = sign(target - current) * acceleration * delta
	if sign(current - target) != sign(current + change - target):
		self.velocity.x = target
		return
	
	self.velocity.x = current + change
