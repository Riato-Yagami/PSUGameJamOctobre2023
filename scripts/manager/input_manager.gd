extends Node

var player
var fingers = ["thumb","index","middle","ring","pinky"]

func set_player(new_player):
	player = new_player
			
func _input(event):
	if event.is_action_released("start"):
		SceneManager.load_game()
			
	if event.is_action_released("escape"):
		SceneManager.quit()
		
	if(GameManager.in_game):
		finger_input(event)
		
func finger_input(event):
	for finger in fingers:
		if event.is_action_pressed(finger):
			player.unfold(finger)
		if event.is_action_released(finger):
			player.fold(finger)
