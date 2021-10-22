extends Node2D

#var player:Player = null

signal state_changed(new_state)

enum State{
	IDLE,
	ACTIVE
}

onready var detection_zone = $DetectionZone

var current_state = State.IDLE setget set_state

func set_state(new_state: int):
	if new_state == current_state:
		return
	current_state = new_state
	emit_signal("state_changed", current_state)


 

func _on_DetectionZone_body_entered(body):
	pass # Replace with function body.
