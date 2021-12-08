extends KinematicBody2D
signal death
onready var ia = $IA
onready var player_animation = $AnimationPlayer
export (int) var vida = 3
export (int) var dmg = 1
export (float) var velocity = 300
onready var state_machine = $StateMachine
onready var hurt_sound = $HurtAudio
onready var dead_sound = $DeadAudio
var motion = Vector2.ZERO
var can_damage = false
var explode_damage = false

func _ready():
	state_machine.set_parent(self)
	ia.initialize(self)

func _play_animation(anim_name:String):
	if player_animation.has_animation(anim_name):
		player_animation.play(anim_name)

#func _is_animation_playing(animation_name:String)->bool:
#	return player_animation.current_animation == animation_name && player_animation.is_playing()


#func _play_animation(animation_name:String, should_restart:bool = true, playback_speed:float = 1.0):
#	if player_animation.has_animation(animation_name):
#		if should_restart:
#			player_animation.stop()
#		player_animation.playback_speed = playback_speed
#		player_animation.play(animation_name)

func hit(damage_to_take, knock):
	knockback(knock)
	hurt_sound.play()
	vida -= damage_to_take

func knockback(knock):
	move_and_slide(motion-motion*knock) 
	
func _remove():
	emit_signal("death")
	queue_free()

func _follow_player(target):
	if target != null:
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
