extends "res://Assets/Scripts/AbstractState.gd"

signal death

func enter():
	emit_signal("death")
	parent._remove()

