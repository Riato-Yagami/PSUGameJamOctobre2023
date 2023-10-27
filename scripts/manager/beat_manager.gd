extends Node

var beat = 0
var bpm = 120.0
var frequency = 0.0
var timer = 0.0

func _ready():
	update_frequency()

func update_frequency():
	frequency = (60 / bpm)
	
func set_bpm(value):
	bpm = value
	update_frequency()
	
func _process(delta):
	if(timer >= frequency):
		new_beat()
		timer = 0
	timer+= delta
	
func new_beat():
	beat+= 1
	HandManager.beat()
	print(beat)
	
