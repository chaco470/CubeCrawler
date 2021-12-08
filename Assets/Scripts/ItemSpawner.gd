extends Node


export(Array, PackedScene) var items


onready var position = $Position2D


func _ready():
	randomize()
	var item_instance = items[round(rand_range(-0.50, items.size()-0.51))].instance()
	item_instance.global_position = position.get_global_position()
	get_tree().get_root().call_deferred("add_child",item_instance)
