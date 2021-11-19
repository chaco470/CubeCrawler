extends Node


export(Array, PackedScene) var items


onready var position = $Position2D


func _ready():
	var item_instance = items[round(rand_range(0, items.size()-1))].instance()
	item_instance.global_position = position.get_global_position()
	get_tree().get_root().call_deferred("add_child",item_instance)
