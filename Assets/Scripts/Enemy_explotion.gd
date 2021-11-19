extends KinematicBody2D

onready var ia = $IA
signal death

export (int) var vida = 3
export (int) var dmg = 1
export (float) var velocity = 300
onready var state_machine = $StateMachine
var motion = Vector2.ZERO
var can_damage = false
var explode_damage = false

func _ready():
	state_machine.set_parent(self)
	ia.initialize(self)
	

func hit(damage_to_take):
	vida -= damage_to_take
func _remove():
	queue_free()
	
func _follow_player(target):
	motion = position.direction_to(target.position) * velocity
	look_at(target.global_position)
	motion = move_and_slide(motion)

func _explode():
		GlobalObjects.camera.shake(100)
		if can_damage and ia.target != null:
			ia.target.notify_hit(-dmg)
		queue_free()

func _on_ExplotionRadio_body_entered(body):
	if body.has_method("notify_hit"):
		can_damage = true


func _on_ExplotionRadio_body_exited(body):
	if body.has_method("notify_hit"):
		can_damage = false
