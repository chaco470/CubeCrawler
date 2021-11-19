extends Sprite

var max_speed_boost = 1
var cadencia_disparo = 1
var health_to_add = 0
var size = 1
var kind = "stats"

func initialize(globalPos):
	self.position = globalPos

func _on_Area2D_body_entered(body):
	if body.has_method("handle_pick_stat"):
		body.handle_pick_stat(self)
		print("objeto adquirido")
		queue_free()

func set_values(mxSpeed, cd, hta, siz):
	max_speed_boost = mxSpeed
	cadencia_disparo = cd
	health_to_add = hta
	size = siz
