extends CharacterBody2D
class_name MainPlayer

@export var direction: Direction = Direction.RIGHT
enum Direction {LEFT = -1, RIGHT = 1}

@export var walk_speed: float = 125
@export var walk_accel: float = 5000

var velocity_x_snap_threshold: float = 0.1

@export var dash_duration: float = 0.1
@export var dash_speed: float = 500
@export var dash_accel: float = 500000
var dash_ready: bool = false

@export var airborn_speed: float = 100
@export var airborn_accel: float = 1500

@export var fall_speed: float = 500
@export var fall_accel: float = 1500

@export var jump_duration: float = 0.15
@export var jump_speed: float = 300
@export var jump_accel: float = 2000
var jump_ready: bool = false

func _physics_process(delta):
	move_and_slide()
	if is_on_floor():
		dash_ready = true
		jump_ready = true


func update_x_velocity(target: float, acceleration: float, delta: float):
	var current = self.velocity.x
	if abs(current - target) < velocity_x_snap_threshold:
		velocity.x = target
		return
	
	var change = sign(target - current) * acceleration * delta
	if sign(current - target) != sign(current + change - target):
		velocity.x = target
		return
	
	velocity.x = current + change


func get_movement_direction() -> int:
	if Input.is_action_pressed("move_left"):
		direction = Direction.LEFT
		return -1
	elif Input.is_action_pressed("move_right"):
		direction = Direction.RIGHT
		return 1
	else:
		return 0
