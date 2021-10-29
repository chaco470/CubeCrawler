extends KinematicBody2D


export (int) var dmg = 1
export (float) var velocity = 100

var can_damage = false
var target = null
var motion = Vector2.ZERO


#func _ready():
#	target = get_parent().get_node("Player")


func _physics_process(delta):
	motion = Vector2.ZERO
	if target != null:
		_follow_player()
	if can_damage and target != null:
		target.notify_hit(-dmg)


func hit():
	queue_free()



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		target = body



func _on_Area2D_body_exited(body):
	target = null 

func _follow_player():
	motion = position.direction_to(target.global_position) * velocity
	look_at(target.global_position)
	motion = move_and_slide(motion)

func _on_HitPlayer_body_entered(body):
	if body.has_method("notify_hit"):
		can_damage = true


func _on_HitPlayer_body_exited(body):
	can_damage = false
