extends "res://Assets/Scripts/AbstractState.gd"

onready var death_menu = "res://GUI/DeathMenu.tscn"

func enter():
	parent._remove()
	get_tree().change_scene(death_menu)

