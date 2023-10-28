extends Node

var root
var main
var game

var game_scene #= preload("res://scenes/game.tscn")
var menu_scene #= preload("res://scenes/menu.tscn")
var score_scene
var scene_node

var web

func _ready():
	if(OS.get_distribution_name() == ""): web = true
	root = get_tree().root
	main = root.get_node("Main")
	scene_node = main.get_node("Scene")
	
	game_scene = load("res://scenes/game.tscn")
	menu_scene = load("res://scenes/menu.tscn")
	score_scene = load("res://scenes/score.tscn")
	
	load_menu()

func quit():
	if(MenuManager.in_menu): get_tree().quit()
	else : if(ScoreManager.in_score and !ScoreManager.name_entered): return
	load_menu()

func load_menu():
	ScoreManager.in_score = false
	GameManager.in_game = false
	load_new_scene(menu_scene)
	MenuManager.init()
#	MenuManager.in_menu = true

func load_game():
	MenuManager.in_menu = false
	load_new_scene(game_scene)
	GameManager.init_game()
	
func load_score():
	GameManager.in_game = false
	load_new_scene(score_scene)
	ScoreManager.init()
	
func start():
	if(MenuManager.in_menu): load_game()
	else: if(ScoreManager.in_score and ScoreManager.name_entered): load_menu()
	
func load_new_scene(scene):
	var node = scene.instantiate()
	remove_old_scenes()
	scene_node.add_child(node)

func remove_old_scenes():
	var old_scenes = scene_node.get_children()
	for scene in old_scenes:
		scene.queue_free()
