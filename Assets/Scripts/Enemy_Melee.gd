extends KinematicBody2D

var target

var motion = Vector2()

func _ready():
	target = get_parent().get_node("Player")


func _physics_process(delta):
	position += (target.position - position) / 50
	
	look_at(target.position)
	move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
