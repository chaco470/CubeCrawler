extends "res://Assets/Scripts/AbstractStateMachine.gd"


func _ready():
	states_map = {
		"patrol": $Patrol,
		"dead": $Dead,
		"engage": $Engage
	}

