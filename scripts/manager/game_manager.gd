extends Node

var game
var player
var enemy
var life = 3

var hearts_node
var round_node
var round_label
var round = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	game = SceneManager.main.get_node("Game")
	player = game.get_node("Hands/Player")
	enemy = game.get_node("Hands/Enemy")
	hearts_node = game.get_node("Control/Hearts")
	round_node = game.get_node("Control/Round")
	round_label = round_node.get_node("Count")
	
	FigureManager.generate_enemy_figures()
	InputManager.set_player()
	
#func _process(delta):
#	compare(player,enemy)

func confrontation():
	var enemy_figure = FigureManager.get_enemy_figure(round)
#	print(enemy_figure)
	enemy.set_figure(enemy_figure)
	var win = compare(player,enemy)
#	print(win)
	
	if win == -1:
		print("Lose")
		damage()
	else: if win == 0:
		print("Draw")
	else:
		print("Win")

	if(life == 0):
		game_over()
		
func damage():
	hearts_node.get_child(life-1).damage()
	life -= 1
	
func new_round():
	round += 1
	round_label.text = str(round)
	await TimeManager.sleep_beat()
	enemy.set_figure("rock")
	
func game_over():
	SceneManager.quit()
	
func compare(player1,player2):
	var win_state = FigureManager.get_winner(player1.figure,player2.figure)
	return win_state
