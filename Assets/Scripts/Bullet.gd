extends Area2D
class_name Bullet
export (float) var bullet_speed = 2000
var damage
var degree
export (PackedScene) var shoot_particle



	
func initialize(rotation_given,spawn_position:Vector2, degree:Vector2, damage_to_make):
	self.degree = degree
	self.rotation = rotation_given
	global_position = spawn_position
	damage = damage_to_make
	
	

func _process(delta):
	position += degree * bullet_speed * delta

func _on_Bullet_body_entered(body):
	_destroy(body)


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()

func _destroy(obj):
	if obj.has_method("hit"):
		obj.hit(damage)
	var shoot_p = shoot_particle.instance() as Particles2D
	get_parent().add_child(shoot_p)
	shoot_p.position = self.global_position
	shoot_p.rotation = self.rotation
	print(shoot_p.position)
	print(self.global_position)
	queue_free()


func _on_Distance_timeout():
	_destroy(self)
