extends Node

var max_speed_boost = 1
var cadencia_disparo = 1
var health_to_add = 0
var size = 1
var kind = "stats"


func set_values(mxSpeed, cd, hta, siz):
	max_speed_boost = mxSpeed
	cadencia_disparo = cd
	health_to_add = hta
	size = siz

func set_bullet_values(b_speed, b_size, b_distance, k_back, dmg):
	BulletState.set_values(b_speed, b_size, b_distance, k_back, dmg)
