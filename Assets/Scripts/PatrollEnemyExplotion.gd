extends "res://Assets/Scripts/AbstractState.gd"
#func enter():
	#parent.ia._on_Patroll()

func update(delta):
	if parent.vida <= 0:
		emit_signal("finished", "dead")
	if parent.ia.target != null :
		emit_signal("finished", "engage")
	

