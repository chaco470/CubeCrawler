extends "res://Assets/Scripts/AbstractStatPickUp.gd"

func _ready():
	set_values(1, 1, 1, 1)



func _on_Area2D_body_entered(body):
	if body.has_method("handle_pick_stat"):
		body.handle_pick_stat(self)
		print("objeto adquirido")
		queue_free()

