extends "res://Assets/Scripts/AbstractStateMachine.gd"


func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"jump": $Jump,
		"death": $Death
	}


func notify_hit(amount):
	PlayerData.current_health += min(amount, PlayerData.max_health)
	print(PlayerData.current_health)
	
