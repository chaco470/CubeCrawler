extends Area2D
class_name Bullet
export (float) var bullet_speed = 2000
var degree


func _ready():
	pass
	
func initialize(rotation_given,spawn_position:Vector2, degree:Vector2):
	self.degree = degree
	self.rotation = rotation_given
	global_position = spawn_position
	
	

func _process(delta):
	position += degree * bullet_speed * delta

func _on_Bullet_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
