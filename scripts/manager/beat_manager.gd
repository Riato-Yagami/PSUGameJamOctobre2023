extends Node

var beat = 0
const FIRST_BEAT = 4

const INITIAL_BPM = 1200.0
var bpm_acceleration = 10
var bpm = 120.0
var frequency = 0.0

var timer = 0.0

#func _ready():
#	set_bpm(bpm)
	
func init():
	beat = FIRST_BEAT
	set_bpm(INITIAL_BPM)
	
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
	if phase == 1:
		ShakeManager.shake(3.0,0.3)
	if phase == 2:
		ShakeManager.shake(4.0,0.3)
		InformationManager.hide()
	if phase == 3:
		ShakeManager.shake(5.0,0.3)
		GameManager.confrontation()

	var pause = (phase >= 3)
	
	HandManager.beat(pause)
	
	ShakeManager.shake(1.0,0.3)
	beat+= 1
	
func increase_bpm():
	set_bpm(bpm + bpm_acceleration)
	print(bpm)

	
