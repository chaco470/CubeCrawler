extends Area2D
class_name EnemyBullet
var bullet_speed = 1000
var damage
var degree


func _ready():
	pass
	
func initialize(rotation_given,spawn_position:Vector2, degree:Vector2, damage_to_make, bullet_speed_given):
	self.degree = degree
	self.rotation = rotation_given
	global_position = spawn_position
	damage = damage_to_make
	bullet_speed = bullet_speed_given

func _process(delta):
	position += degree * bullet_speed * delta


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func _on_Enemy_bullet_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit(-damage)
	queue_free()
