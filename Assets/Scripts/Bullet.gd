extends RigidBody2D

export (float) var bullet_speed = 2000


func _ready():
	self.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
	


func _on_Bullet_body_entered(body):
	queue_free()
