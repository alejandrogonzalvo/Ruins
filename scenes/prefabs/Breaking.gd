extends State

func process(_delta):
	pass
	
func physics_process(_delta):
	pass
	
func enter(_from: State = null):
	$Timer.start()
	
func exit(_to: State = null):
	pass


func _on_timer_timeout():
	transition.emit(self, "broken")
