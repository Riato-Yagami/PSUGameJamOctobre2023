extends Node

var player
var fingers = ["thumb","index","middle","ring","pinky"]

func set_player(new_player):
	player = new_player
			
func _input(event):
	for finger in fingers:
		if event.is_action_pressed(finger):
			player.unfold(finger)
		if event.is_action_released(finger):
			player.fold(finger)
			
	if event.is_action_released("start"):
		SceneManager.load_game()
			
	if event.is_action_released("escape"):
		SceneManager.quit()
