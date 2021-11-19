extends "res://Assets/Scripts/AbstractState.gd"

func update(delta):
	if parent.vida <= 0:
		emit_signal("finished", "dead")
	parent.ia._on_Engage()
	parent._demage()
