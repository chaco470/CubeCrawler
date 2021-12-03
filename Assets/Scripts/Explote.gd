extends "res://Assets/Scripts/AbstractState.gd"
func enter():
	parent.dead_sound.play()
	parent._play_animation("Explote2")
	$Timer.start()

func _on_Timer_timeout():
	parent._remove()
