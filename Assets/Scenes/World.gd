extends Node
onready var enemigos_s_1 = $Enemigos_sala_1
onready var enemigos_s_2 = $Enemigos_sala_2
onready var puerta1 = $Puerta
onready var puerta2 = $Puerta2
onready var puerta3 = $Puerta3
onready var puerta4 = $Puerta4

# Called when the node enters the scene tree for the first time.
func _ready():
	enemigos_s_1.initialize(puerta1, puerta2)
	enemigos_s_2.initialize(puerta3, puerta4)

