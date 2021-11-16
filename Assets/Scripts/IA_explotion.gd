extends Node2D

signal state_changed(new_state)

var parent = null

enum State{
	PATROL,
	ENGAGE,
	EXPLOTE
}

onready var player_detector = $Detector
onready var explotion_timer = $ExplotionTimer
onready var explotion_whait_timer = $ExplotionWhaitTimer

var current_state = State.PATROL setget set_state
var target = null

func initialize(parent_given):
	parent = parent_given

func _physics_process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if target != null:
				parent._follow_player(target)
		State.EXPLOTE:
			explotion_whait_timer.start()
		_:
			print("Error: no se wacho")



func set_state(new_state):
	if new_state == current_state:
		return
	current_state = new_state
	emit_signal("script_changed", current_state)

func _on_Detector_body_entered(body):
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		target = body
		explotion_timer.start()


func _on_Detector_body_exited(body):
	if body.is_in_group("player"):
		set_state(State.PATROL)
		target = null


func _on_ExplotionTimer_timeout():
	set_state(State.EXPLOTE)


func _on_ExplotionWhaitTimer_timeout():
	parent._explode()
