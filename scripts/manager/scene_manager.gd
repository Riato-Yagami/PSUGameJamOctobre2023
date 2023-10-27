extends Node

var root
var main
var game

var web

func _ready():
	if(OS.get_distribution_name() == ""): web = true
	root = get_tree().root
	main = root.get_node("Main")
	game = main.get_node("Game")
