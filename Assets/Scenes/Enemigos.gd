extends Node

var puerta_1
var puerta_2



func initialize(puerta1, puerta2):
	puerta_1 = puerta1
	puerta_2 = puerta2

func _physics_process(delta):
	if get_children().size() <=0:
		puerta_1.abrir()
		puerta_2.abrir()
