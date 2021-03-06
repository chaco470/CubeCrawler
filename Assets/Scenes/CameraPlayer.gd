extends Camera2D

onready var shake_timer = $Timer
onready var shake_tween = $Tween
onready var music = $LevelMusic

var shake_amount = 0
var default_offset = offset

export (Array) var playList

func _ready():
	randomize()
	music.stream = playList[round(rand_range(-0.5, 3.49))]
	music.play()
	music.volume_db = -35.0
	GlobalObjects.camera = self
	set_process(false)

func _physics_process(delta):
	offset = Vector2(rand_range(-shake_amount, shake_amount),rand_range(shake_amount, -shake_amount)) * delta + default_offset



func shake(new_shake, shake_time = 0.2, shake_limit = 100):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shake_timer.wait_time = shake_time
	
	shake_tween.stop_all()
	set_process(true)
	shake_timer.start()



func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)
	shake_tween.interpolate_property(self, "offset", offset, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	shake_tween.start()













func _on_LevelMusic_finished():
	music.stream = playList[round(rand_range(0.0, 2.0))]
	music.play()
