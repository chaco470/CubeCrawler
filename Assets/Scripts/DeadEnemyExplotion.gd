extends "res://Assets/Scripts/AbstractState.gd"


func enter():
	parent.ia.puedeExplotar = false
	parent.emit_signal("death")
	parent.dead_sound.play()
	parent._play_animation("dead")
	

func _on_EnemyAnimation_animation_finished(dead):
	parent._remove()
