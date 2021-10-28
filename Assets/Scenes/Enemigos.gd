extends Node

onready var puerta_1 = $Puerta
onready var puerta_2 = $Puerta2



func _physics_process(delta):
	if get_children().size() <=2:
		puerta_1.abrir()
		puerta_2.abrir()
