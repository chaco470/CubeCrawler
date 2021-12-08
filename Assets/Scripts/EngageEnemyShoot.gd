extends "res://Assets/Scripts/AbstractState.gd"

func update(delta):
	parent._play_animation("engage")
	if parent.vida <= 0:
		emit_signal("finished", "dead")
	parent.ia._on_Engage()
	parent.ia._on_Shoot()
