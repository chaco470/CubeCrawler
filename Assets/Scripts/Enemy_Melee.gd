extends KinematicBody2D

var target

var motion = Vector2()


#func _ready():
#	target = get_parent().get_node("Player")


func _physics_process(delta):
	if target != null:
		if target.is_in_group("player"):
		
			position += (target.position - position) / 50
			look_at(target.global_position)
			move_and_collide(motion)
			
		else:
			target = target


func hit():
	queue_free()



func _on_Area2D_body_entered(body):
	target = body



func _on_Area2D_body_exited(body):
	target = null 

