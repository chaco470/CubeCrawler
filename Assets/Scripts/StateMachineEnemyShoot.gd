extends "res://Assets/Scripts/AbstractStateMachine.gd"
signal memori

func _ready():
	states_map = {
		"patrol": $Patrol,
		"dead": $Dead,
		"engage": $Engage
	}




