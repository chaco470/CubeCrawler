extends "res://Assets/Scripts/AbstractStateMachine.gd"

signal memori

func _ready():
	states_map = {
		"patrol": $Patrol,
		"dead": $Dead,
		"engage": $Engage
	}
	for c in get_children():
		c.connect("death", self, "estoy_muerto")


		
func estoy_muerto():
	emit_signal("memori")
