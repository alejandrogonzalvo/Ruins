extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.velocity = Vector2.DOWN * 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	$Player.velocity += Vector2.DOWN
	$Player.move_and_slide()
