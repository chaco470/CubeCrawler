extends "res://Assets/Scripts/AbstractState.gd"
func enter():
	parent._play_animation("Explote2")
	parent.dead_sound.play()
	$Timer.start()

func update(delta):
	if parent.vida <= 0:
		$Timer.stop()
		emit_signal("finished", "dead")

func _on_Timer_timeout():
	parent._remove()
