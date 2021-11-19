extends KinematicBody2D
class_name Enemy
signal death
onready var ia = $IA
export (int) var vida = 1
export (int) var dmg = 1
export (float) var velocity = 300
onready var state_machine = $StateMachine
var motion = Vector2.ZERO
var can_damage = false

func _ready():
	state_machine.set_parent(self)
	ia.initialize(self)

func _remove():
	emit_signal("death")
	queue_free()
	
func _demage():
	if can_damage and ia.target != null:
		ia.target.notify_hit(-dmg)

func hit(damage_to_take):
	vida -= damage_to_take

func _follow_player(target):
	if target != null:
		motion = position.direction_to(target.position) * velocity
		look_at(target.global_position)
		motion = move_and_slide(motion)


func _on_HitBox_body_entered(body):
	if body.has_method("notify_hit"):
		can_damage = true


func _on_HitBox_body_exited(body):
	if body.has_method("notify_hit"):
		can_damage = false
