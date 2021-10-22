extends "res://Assets/Scripts/AbstractState.gd"


func update(delta):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	
	if parent.axis == Vector2.ZERO:
		emit_signal("finished", "idle")
	
