extends State

@export var platform: CharacterBody2D
var collided: bool

func _ready():
	platform.velocity = Vector2.DOWN
		
func process(_delta):
	pass

func physics_process(_delta):
	collided = platform.move_and_slide()
	platform.velocity = platform.velocity * 1.08
	
func enter(_from: State = null):
	platform.velocity = Vector2.DOWN
	
func exit(_to: State = null):
	pass
