extends KinematicBody2D

var target
export (int) var dmg = 1

var motion = Vector2()


#func _ready():
#	target = get_parent().get_node("Player")


func _physics_process(delta):
	if target != null:
		_follow_player()


func hit():
	queue_free()



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		target = body



func _on_Area2D_body_exited(body):
	target = null 

func _follow_player():
	position += (target.position - position) / 50
	look_at(target.global_position)
	move_and_collide(motion)

func _on_HitPlayer_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit(-dmg)
