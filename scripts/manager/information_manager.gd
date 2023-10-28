extends Node

var information_node
var label
var information_hand

func _ready():
	information_node = GameManager.game.get_node("Control/Information")
	label = information_node.get_node("Label")
	information_hand = information_node.get_node("Hand")
	
func show():
	information_node.visible = true
	var next_figure = FigureManager.get_enemy_figure(GameManager.round + 1)
	information_hand.set_figure(next_figure)
	
#	label.text = "next : " + FigureManager.get_enemy_figure(GameManager.round + 1)
	
func hide():
	information_node.visible = false
