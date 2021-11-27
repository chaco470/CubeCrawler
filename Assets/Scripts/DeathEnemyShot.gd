extends "res://Assets/Scripts/AbstractState.gd"

func enter():
	parent.dead_sound.play()
	parent._play_animation("dead")


func _on_EnemyAnimation_animation_finished(anim_name):
	parent._remove()
