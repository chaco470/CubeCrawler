extends "res://Assets/Scripts/AbstractStatPickUp.gd"


func _on_Area2D_body_entered(body):
		if body.has_method("handle_pick_stat"):
			set_bullet_values(1, 1.2, 0, 1, 1)
			queue_free()

