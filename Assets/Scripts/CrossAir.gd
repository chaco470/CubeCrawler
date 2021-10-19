extends Node

export (StreamTexture) var crossAir


func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(crossAir)
