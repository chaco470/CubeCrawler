extends KinematicBody2D

export (float) var speed = 500
export (PackedScene) var bullet:PackedScene
onready var bullet_spawn = $BulletSpawn

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var motion = Vector2()
	motion.y = int(Input.is_action_pressed("_down")) - int(Input.is_action_pressed("_up"))
	motion.x = int(Input.is_action_pressed("_rigth")) - int(Input.is_action_pressed("_left"))
	
	motion.normalized()
	motion = move_and_slide(motion * speed)
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = bullet_spawn.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().reload_current_scene()









func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()
