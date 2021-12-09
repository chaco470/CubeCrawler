extends Sprite

onready var main_menu_scene = "res://GUI/MainMenu.tscn"

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene(main_menu_scene)
