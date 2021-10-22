extends Node
onready var enemigos_s_1 = $Enemigos_sala_1
onready var puerta1 = $Puerta
onready var puerta2 = $Puerta2

# Called when the node enters the scene tree for the first time.
func _ready():
	enemigos_s_1.initialize(puerta1, puerta2)


