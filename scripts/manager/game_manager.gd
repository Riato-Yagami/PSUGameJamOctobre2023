extends Node

var game
var player
var enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	game = SceneManager.main.get_node("Game")
	player = game.get_node("Hands/Player")
	enemy = game.get_node("Hands/Enemy")
	
func _process(delta):
	compare(player,enemy)
	
func compare(player1,player2):
	var win_state = FiguresManager.get_winner(player1.figure,player2.figure)
#	print(win_state)
	
