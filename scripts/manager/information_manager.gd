extends Node

var information_node
var label
var information_hand
var pictogram

var next: Texture
var repeat: Texture
var previous: Texture

func _ready():
	next = load("res://sprites/pictograms/next.png")
	previous = load("res://sprites/pictograms/previous.png")
	repeat = load("res://sprites/pictograms/repeat.png")

func init():
	information_node = GameManager.game.get_node("Control/Information")
	information_node.visible = false
	label = information_node.get_node("Label")
	information_hand = information_node.get_node("Hand")
	pictogram = information_node.get_node("Pictogram")
	
func show():
	information_node.visible = true
	var next_figure = FigureManager.get_enemy_figure(GameManager.round + 1)
	
	if((GameManager.round % (400 -1))> 2):
		var current_figure = FigureManager.get_enemy_figure(GameManager.round)
		var previous_figure = FigureManager.get_enemy_figure(GameManager.round - 1)
		if(next_figure == current_figure):
			pictogram.texture = repeat
			information_hand.visible = false
			return
		if(next_figure == previous_figure):
			pictogram.texture = previous
			information_hand.visible = false
			return
	
	pictogram.texture = next
	information_hand.visible = true
	information_hand.set_figure(next_figure)
	
	
#	label.text = "next : " + FigureManager.get_enemy_figure(GameManager.round + 1)
	
func hide():
	information_node.visible = false
