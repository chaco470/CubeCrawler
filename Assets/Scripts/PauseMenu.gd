extends Control

onready var main_menu_scene = "res://GUI/MainMenu.tscn"
onready var continue_button = $Botones/PauseContinueButton
onready var restart_button = $Botones/PauseRestartButton
onready var main_menu_button = $Botones/PauseMainMenuButton
onready var exit_button = $Botones/PauseExitButton

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
	get_tree().paused = false
	get_tree().change_scene(main_menu_scene)


func _on_PauseExitButton_pressed():
	get_tree().quit()

func _on_PauseContinueButton_mouse_entered():
	continue_button.grab_focus()


func _on_PauseMainMenuButton_mouse_entered():
	main_menu_button.grab_focus()

func _on_PauseExitButton_mouse_entered():
	exit_button.grab_focus()


func _on_PauseRestartButton_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_PauseRestartButton_mouse_entered():
	restart_button.grab_focus()
