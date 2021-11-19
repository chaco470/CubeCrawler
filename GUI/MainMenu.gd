extends MarginContainer

export (PackedScene) var first_level 

onready var start_selector = $MainCContainer/MainVContainer/OptionsCContainer/OptionsVContainer/StartCContainer/StartHContainer/Selector
onready var exit_selector = $MainCContainer/MainVContainer/OptionsCContainer/OptionsVContainer/ExitCContainer/ExitHContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") && current_selection != 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") && current_selection != 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene_to(first_level)
	elif _current_selection == 1:
		get_tree().quit()

func set_current_selection(_current_selection):
	start_selector.text = ""
	exit_selector.text = ""
	if _current_selection == 0:
		start_selector.text = ">"
	elif _current_selection == 1:
		exit_selector.text = ">"
