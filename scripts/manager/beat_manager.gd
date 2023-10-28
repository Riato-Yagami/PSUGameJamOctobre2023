extends Node

var beat = 0
const FIRST_BEAT = 4
var bpm = 90.0
var frequency = 0.0
var timer = 0.0

func _ready():
	beat = FIRST_BEAT
	set_bpm(bpm)

func update_frequency():
	frequency = (60 / bpm)
	
func set_bpm(value):
	bpm = value
	update_frequency()
	AudioManager.update_music_speed()
	
func _process(delta):
	if(timer >= frequency and GameManager.in_game):
		new_beat()
		timer = 0
	timer+= delta

func new_beat():
	var phase = beat % 6
	if phase == 0:
		InformationManager.show()
		GameManager.new_round()
	if phase == 2:
		InformationManager.hide()
	if phase == 3:
		GameManager.confrontation()

	var pause = (phase >= 3)
	HandManager.beat(pause)

	beat+= 1
	

	
