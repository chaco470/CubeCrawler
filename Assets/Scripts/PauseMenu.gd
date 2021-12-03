extends Control

onready var continue_button = $Botones/PauseContinueButton
onready var main_menu_button = $Botones/PauseMainMenuButton
onready var exit_button = $Botones/PauseExitButton

onready var main_menu_scene = "res://GUI/MainMenu.tscn"

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		continue_button.grab_focus()


func _on_PauseContinueButton_pressed():
	visible = false
	get_tree().paused = false 


func _on_PauseMainMenuButton_pressed():
	get_tree().change_scene(main_menu_scene)


func _on_PauseExitButton_pressed():
	visible = false
	get_tree().paused = false
	get_tree().quit()

func _on_PauseContinueButton_mouse_entered():
	continue_button.grab_focus()


func _on_PauseMainMenuButton_mouse_entered():
	main_menu_button.grab_focus()

func _on_PauseExitButton_mouse_entered():
	exit_button.grab_focus()
