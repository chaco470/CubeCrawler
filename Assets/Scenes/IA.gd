extends Node2D

signal state_changed(new_state)

enum State{
	PATROL,
	ENGAGE
}

onready var player_detector = $Detector

var current_state = State.PATROL setget set_state
var target = null


func _physics_process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if target != null:
				self.get_parent()._follow_player(target)
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


func _on_Detector_body_exited(body):
	set_state(State.PATROL)
	target = null
