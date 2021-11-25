extends Node


func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	seed(random.to_string().hash())

