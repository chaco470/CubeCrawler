extends Control

export (PackedScene) var first_level_scene
export (PackedScene) var main_menu_scene

onready var new_game_button = $Botones/DeathNewGameButton
onready var main_menu_button = $Botones/DeathMainMenuButton
onready var exit_button = $Botones/DeathExitButton
onready var game_over_music = $GameOver

func _physics_process(delta):
	if !game_over_music.playing:
		game_over_music.play()

func _on_DeathNewGameButton_pressed():
	get_tree().change_scene_to(first_level_scene)

func _on_DeathNewGameButton_mouse_entered():
	new_game_button.grab_focus()

func _on_DeathMainMenuButton_pressed():
	get_tree().change_scene_to(main_menu_scene)


func _on_DeathMainMenuButton_mouse_entered():
	main_menu_button.grab_focus()

func _on_DeathExitButton_pressed():
	get_tree().quit()


func _on_DeathExitButton_mouse_entered():
	exit_button.grab_focus()
