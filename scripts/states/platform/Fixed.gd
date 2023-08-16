extends State

func process(_delta):
	pass
	
func physics_process(_delta):
	pass
	
func enter(_from: State = null):
	pass
	
func exit(_to: State = null):
	pass

func _on_hitbox_body_entered(body):
	transition.emit(self, "breaking")
