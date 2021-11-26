extends KinematicBody2D

signal death

export (int) var vida = 3
export (int) var dmg = 1
export (float) var velocity = 200
export (PackedScene) var bullet:PackedScene
var motion = Vector2.ZERO
onready var bullet_spawn = $BulletSpawner
onready var ia = $IA_shooter
onready var state_machine = $StateMachine
onready var player_detector = $Detector
onready var hurt_sound = $HurtAudio

func _ready():
	state_machine.set_parent(self)
	ia.initialize(self)
	ia.set_parent(self)

func _fire_player():
	var bullet_instance = bullet.instance()
	bullet_instance.initialize(self.rotation,bullet_spawn.get_global_position(), global_position.direction_to(bullet_spawn.global_position), dmg, 700)
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func _follow_player(target):
	if target != null:
		motion = position.direction_to(target.position) * velocity
		look_at(target.global_position)
		motion = move_and_slide(motion)
		
func _remove():
	emit_signal("death")
	queue_free()

func hit(damage_to_take):
	hurt_sound.play()
	vida -= damage_to_take

func _patrullar():
	pass

