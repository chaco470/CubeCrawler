extends "res://Assets/Scripts/AbstractState.gd"
signal death

func enter():
	parent._remove()
