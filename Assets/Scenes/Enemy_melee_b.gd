extends KinematicBody2D
class_name Enemy

onready var ia = $IA
signal death

export (int) var vida = 3
export (int) var dmg = 1
export (float) var velocity = 100

var motion = Vector2.ZERO
var can_damage = false

func _physics_process(delta):
	if vida <= 0:
		queue_free()
		emit_signal("death")
	if can_damage and ia.target != null:
		ia.target.notify_hit(-dmg)

func hit(damage_to_take):
	vida -= damage_to_take

func _follow_player(target):
	motion = position.direction_to(target.position) * velocity
	look_at(target.global_position)
	motion = move_and_slide(motion)


func _on_HitBox_body_entered(body):
	if body.has_method("notify_hit"):
		can_damage = true


func _on_HitBox_body_exited(body):
	if body.has_method("notify_hit"):
		can_damage = false
