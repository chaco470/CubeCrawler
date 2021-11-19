extends "res://Assets/Scripts/AbstractState.gd"
func enter():
	parent.ia.explotion_timer.start()
	
func update(delta):
	if parent.vida <= 0:
		emit_signal("finished", "dead")
	if !parent.ia.stopEngage:
		parent.ia._on_Engage()
	else:
		emit_signal("finished", "explote")
		
	
