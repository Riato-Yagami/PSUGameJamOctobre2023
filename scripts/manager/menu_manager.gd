extends Node

var menu
var hand
var in_menu

func init():
	menu = SceneManager.scene_node.get_node("Menu")
	hand = menu.get_node("Hand")
	InputManager.set_player(hand)
	in_menu = true
