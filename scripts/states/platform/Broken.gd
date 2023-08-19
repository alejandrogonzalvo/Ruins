extends State

@export var platform: CharacterBody2D
var collided: bool


func physics_process(_delta):
	platform.velocity = platform.velocity * 1.08
	if platform.velocity.y > 10:
		platform.velocity.y = 10
	
func enter(_from: State = null):
	platform.velocity = Vector2.DOWN
	
func exit(_to: State = null):
	pass
