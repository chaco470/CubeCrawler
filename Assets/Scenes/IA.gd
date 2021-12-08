extends Node2D

var parent = null
onready var player_detector = $Detector
var target = null
var stateMachine = null

func initialize(parent_given):
	parent = parent_given
	stateMachine = parent_given.state_machine

func _on_Engage():
	parent._follow_player(target)
	

func _on_Detector_body_entered(body):
	if body.is_in_group("player"):
		target = body

func _on_Detector_body_exited(body):
	if body.is_in_group("player"):
		#set_state(State.PATROL)
		target = null
