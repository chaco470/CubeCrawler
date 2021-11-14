extends CanvasLayer

export (PackedScene) var heart_scene

onready var hearts_container = $HeartsContainer

func _ready():
	PlayerData.connect("max_health_updated", self, "_on_player_max_health_updated")
	PlayerData.connect("health_updated", self, "_on_player_health_updated")

func _reset_hearts():
	var children:Array = hearts_container.get_children()
	for child in children:
		hearts_container.remove_child(child)
		child.queue_free()

func _on_player_max_health_updated(amount:int, current_health:int):
	_reset_hearts()
	for i in amount:
		var new_heart = heart_scene.instance()
		hearts_container.add_child(new_heart)
		new_heart.id = i+1
	_on_player_health_updated(current_health, amount)

func _on_player_health_updated(amount:int, max_health:int):
	for heart in hearts_container.get_children():
		heart.update_heart(amount, max_health)
#	if amount <= 0:
#		if amount == 0:
#			_play_gameover_music()
#		fade_to_black()
