extends Sprite
onready var barrera = $StaticBody2D


func abrir():
	queue_free()


func _on_Area2D_body_entered(body):
	barrera.set_collision_layer(0)
	barrera.set_collision_mask(0)


func _on_Area2D_body_exited(body):
	barrera.set_collision_layer(1)
	barrera.set_collision_mask(1)
