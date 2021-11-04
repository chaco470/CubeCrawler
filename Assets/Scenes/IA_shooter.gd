extends Node2D

signal state_changed(new_state)

enum State{
	PATROL,
	ENGAGE,
	SHOOT
}

onready var player_detector = $Detector
onready var timer = $ShootTimer

var current_state = State.PATROL setget set_state
var target = null
var can_shoot = false


func _physics_process(delta):
	match current_state:
		State.PATROL:
			pass
		State.SHOOT:
			if target != null and can_shoot:
				self.get_parent()._fire_player()
				set_state(State.ENGAGE)
				can_shoot = false
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
		timer.start()


func _on_Detector_body_exited(body):
	set_state(State.PATROL)
	target = null


func _on_ShootTimer_timeout():
	set_state(State.SHOOT)
	can_shoot = true
