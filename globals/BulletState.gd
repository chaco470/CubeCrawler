extends Node

var bullet_speed = 1.0
var bullet_size = 1.0
var knock_back = 1.0
var damage = 1.0
var bullet_distance = 0.4

func set_initial_values(b_speed, b_size, b_distance, k_back, dmg):
	bullet_speed = b_speed
	bullet_size = b_size
	knock_back = k_back
	damage = dmg
	bullet_distance = b_distance

func set_values(b_speed, b_size, b_distance, k_back, dmg):
	bullet_speed *= b_speed
	bullet_size *= b_size
	knock_back *= k_back
	damage *= dmg
	bullet_distance += b_distance

func get_bullet_speed():
	print("bullet speed ----- ", bullet_speed)
	return bullet_speed

func get_bullet_size():
	return  Vector2(bullet_size,bullet_size)

func get_knock_back():
	return knock_back

func get_damage():
	return damage

func get_bullet_distance():
	return bullet_distance
