extends Sprite

export (PackedScene) var first_level_scene 


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to(first_level_scene)
