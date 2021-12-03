extends Control

export (PackedScene) var first_level_scene 
export (PackedScene) var tutorial_scene

onready var intro_music = $IntroMusic
onready var new_game_button = $Menu/Buttons/NewGameButton
onready var tutorial_button = $Menu/Buttons/TutorialButton
onready var exit_button = $Menu/Buttons/ExitButton

func _ready():
	if !intro_music.playing:
		intro_music.play()
	new_game_button.grab_focus()

func _process(delta):
	if (!new_game_button.has_focus() && !tutorial_button.has_focus() && !exit_button.has_focus()):
		new_game_button.grab_focus()

func _on_NewGameButton_pressed():
	get_tree().change_scene_to(first_level_scene)

func _on_TutorialButton_pressed():
	get_tree().change_scene_to(tutorial_scene)

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_NewGameButton_mouse_entered():
	new_game_button.grab_focus()

func _on_TutorialButton_mouse_entered():
	tutorial_button.grab_focus()

func _on_ExitButton_mouse_entered():
	exit_button.grab_focus()
