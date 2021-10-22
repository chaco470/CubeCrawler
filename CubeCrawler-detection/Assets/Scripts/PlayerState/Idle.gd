extends "res://Assets/Scripts/AbstractState.gd"


func handle_input(event:InputEvent):
	if event.is_action_pressed("_left") || event.is_action_pressed("_rigth") || event.is_action_pressed("_up")|| event.is_action_pressed("_down"):
		emit_signal("finished", "walk")


func update(delta:float):
	
	parent._handle_cannon_actions()

	
