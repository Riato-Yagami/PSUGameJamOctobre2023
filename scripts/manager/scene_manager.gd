extends Node

var root
var main
var game

var game_scene #= preload("res://scenes/game.tscn")
var menu_scene #= preload("res://scenes/menu.tscn")

var web

func _ready():
	if(OS.get_distribution_name() == ""): web = true
	root = get_tree().root
	main = root.get_node("Main")
#	game = main.get_node("Game")
	
#	game_scene = load("res://scenes/game.tscn")
#	menu_scene = load("res://scenes/menu.tscn")
#	load_menu()

#func quit():
#	get_tree().quit()
#
#func load_menu():
#	load_new_scene(menu_scene)
#
#func load_game():
#	load_new_scene(game_scene)
#
#func load_new_scene(scene):
#	var node = scene.instantiate()
##	remove_old_scenes()
#	main.add_child(node)
#
#func remove_old_scenes():
#	var old_scenes = main.get_children()
#	for scene in old_scenes:
#		scene.queue_free()
