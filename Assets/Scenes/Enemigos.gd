extends Node

signal abrir

var enemigos = 0

func _ready():
	for c in get_children():
		if c.is_in_group("enemy"):
			enemigos+=1
			c.connect("death",self,"decrementar")
		if c.is_in_group("puerta"):
			self.connect("abrir", c, "abrir_self")

func decrementar():
	enemigos-=1
	if enemigos <= 0:
		emit_signal("abrir")


func _abrir_puertas():
	for c in get_children():
		if c.is_in_group("puerta"):
			print("puertas abiertas")















