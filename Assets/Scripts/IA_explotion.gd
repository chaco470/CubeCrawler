extends Node2D

var parent = null
onready var player_detector = $Detector
onready var explotion_timer = $ExplotionTimer
onready var explotion_wait_timer = $ExplotionWaitTimer
var target = null
var stateMachine = null
var stopEngage = false
var puedeExplotar = true
func initialize(parent_given):
	parent = parent_given
	stateMachine = parent_given.state_machine
	
func _on_Engage():
	parent._follow_player(target)
	

func _on_Detector_body_entered(body):
	if body.is_in_group("player"):
		target = body
		explotion_timer.start()


func _on_Detector_body_exited(body):
	if body.is_in_group("player"):
		target = null
		


func _on_ExplotionTimer_timeout():
	explotion_wait_timer.start()
	stopEngage = true

func _on_ExplotionWhaitTimer_timeout():
	if puedeExplotar:
		parent._explode()
	else:
		parent.queue_free()
