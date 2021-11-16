extends Node2D

signal state_changed(new_state)

enum State{
	PATROL,
	ENGAGE,
	SHOOT
}

onready var player_detector = $Detector
onready var shoot_timer = $ShootTimer
onready var move_timer = $MoveTimer
onready var patrol_timer = $PatrolTimer

var current_state = State.PATROL setget set_state
var target = null
var can_shoot = false
var origin = Vector2.ZERO
var patrol_zone = Vector2.ZERO
var parent_velocity = Vector2.ZERO
var patrol_range_reached = false
var parent = null


func _physics_process(delta):
	match current_state:
		State.PATROL:
			if not patrol_range_reached:
				self.get_parent().move_and_slide(parent_velocity)
				if (parent.global_position.distance_to(patrol_zone) < 5):
					patrol_range_reached = true
					parent_velocity = Vector2.ZERO
					patrol_timer.start()
			pass
		State.SHOOT:
			if target != null and can_shoot:
				self.get_parent()._fire_player()
				can_shoot = false
				move_timer.start()
		State.ENGAGE:
			if target != null:
				self.get_parent()._follow_player(target)
		_:
			print("Error: no se wacho")

func initialize(parent_given):
	parent = parent_given
	

func set_state(new_state):
	if new_state == current_state:
		return
	if new_state == State.PATROL:
		origin = self.global_position
		patrol_timer.start()
		patrol_range_reached = false
	current_state = new_state
	emit_signal("state_changed", current_state)

func _on_Detector_body_entered(body):
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		target = body
		shoot_timer.start()


func _on_Detector_body_exited(body):
	if body.is_in_group("player"):
		set_state(State.PATROL)
		target = null
		can_shoot = false


func _on_ShootTimer_timeout():
	set_state(State.SHOOT)
	can_shoot = true


func _on_MoveTimer_timeout():
	set_state(State.ENGAGE)


func _on_PatrolTimer_timeout():
	var patrol_range = 50
	var random_x = rand_range(-patrol_range, patrol_range)
	var random_y = rand_range(patrol_range, -patrol_range)
	patrol_zone = Vector2(random_x, random_y) + origin
	patrol_range_reached = false
	parent_velocity = self.get_parent().global_position.direction_to(patrol_zone) * 200
