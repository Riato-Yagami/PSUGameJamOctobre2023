extends Node

var game
var player
var enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	game = SceneManager.main.get_node("Game")
	player = game.get_node("Player")
	enemy = game.get_node("Enemy")
	
func compare(player1,player2):
	FiguresManager.get_figure(player1)
	FiguresManager.get_figure(player2)
	
	
