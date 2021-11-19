extends Node2D


onready var player_detector = $Detector
onready var shoot_timer = $ShootTimer
onready var move_timer = $MoveTimer
onready var patrol_timer = $PatrolTimer

var target = null
var can_shoot = false
var origin = Vector2.ZERO
var patrol_zone = Vector2.ZERO
var parent_velocity = Vector2.ZERO
var patrol_range_reached = false
var parent = null
var stateMachine = null

func set_parent(parent):
	parent = parent

func initialize(parent_given):
	parent = parent_given
	stateMachine = parent_given.state_machine


func _on_Patroll():
	if not patrol_range_reached:
		parent.move_and_slide(parent_velocity)
		if (parent.global_position.distance_to(patrol_zone) < 5):
			patrol_range_reached = true
			parent_velocity = Vector2.ZERO
			patrol_timer.start()

func _on_Shoot():
	if target != null and can_shoot:
		self.get_parent()._fire_player()
		can_shoot = false
		move_timer.start()

func _on_Engage():
		self.get_parent()._follow_player(target)



func _on_Detector_body_entered(body):
	if body.is_in_group("player"):
		#set_state(State.ENGAGE)
		target = body
		shoot_timer.start()


func _on_Detector_body_exited(body):
	if body.is_in_group("player"):
		#set_state(State.PATROL)
		target = null
		can_shoot = false


func _on_ShootTimer_timeout():
	can_shoot = true


func _on_MoveTimer_timeout():
	#set_state(State.ENGAGE)
	pass

func _on_PatrolTimer_timeout():
	var patrol_range = 50
	var random_x = rand_range(-patrol_range, patrol_range)
	var random_y = rand_range(patrol_range, -patrol_range)
	patrol_zone = Vector2(random_x, random_y) + origin
	patrol_range_reached = false
	parent_velocity = self.get_parent().global_position.direction_to(patrol_zone) * 200
