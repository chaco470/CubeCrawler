extends KinematicBody2D

signal hit()
signal health_update()

export (float) var speed = 500
export (PackedScene) var bullet:PackedScene
export (int) var max_health = 20
export (int) var damage = 1

var max_speed = 400
var acceleration = 1000
var motion = Vector2.ZERO
var axis = Vector2.ZERO
var can_shoot = true

onready var state_machine = $StateMachine
onready var bullet_spawn = $BulletSpawn
onready var invulnerability_timer = $InvulnerabilityTimer
onready var player_animation = $AnimationPlayer
onready var cadencia_de_disparo = $Cadencia

func _ready():
	state_machine.set_parent(self)
	PlayerData.call_deferred("set_max_health", max_health)


func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("LMB"):
		fire()

func get_input_axis():
	
	axis.x = int(Input.is_action_pressed("_rigth")) - int(Input.is_action_pressed("_left"))
	axis.y = int(Input.is_action_pressed("_down")) - int(Input.is_action_pressed("_up"))
	return axis.normalized()

func _handle_cannon_actions():
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()
		
func _handle_move_input():
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration )
	else:
		applymovement(axis * acceleration )
	motion = move_and_slide(motion)

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func applymovement(acceletarion):
	motion += acceletarion
	motion = motion.clamped(max_speed)
	

func fire():
	if can_shoot:
		var bullet_instance = bullet.instance()
		bullet_instance.initialize(self.rotation,bullet_spawn.get_global_position(), global_position.direction_to(bullet_spawn.global_position), damage)
		get_tree().get_root().call_deferred("add_child",bullet_instance)
		can_shoot = false
		cadencia_de_disparo.start()

func kill():
	get_tree().reload_current_scene()

func notify_hit(amount):
	if invulnerability_timer.is_stopped():
		state_machine.notify_hit(amount)
		invulnerability_timer.start()
		player_animation.queue("hurt_animation")





func _on_InvulnerabilityTimer_timeout():
	player_animation.play("rest_animation")


func _on_Cadencia_timeout():
	can_shoot = true
