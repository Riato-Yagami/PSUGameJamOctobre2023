extends Node

var player
var fingers = ["thumb","index","middle","ring","pinky"]

func _ready():
	player = GameManager.player
			
func _input(event):
	for finger in fingers:
		if event.is_action_pressed(finger):
#			print("pressed : " + finger)
			player.fold(finger)
		if event.is_action_released(finger):
			player.unfold(finger)
