extends Node

var game
var player
var enemy
const TOTAL_LIFE = 3
var life = 3

var half_life = false

var hearts_node
var round_node
var round_label
var round = 0

var in_game = false
# Called when the node enters the scene tree for the first time.

func init_game():
	game = SceneManager.main.get_node("Scene/Game")
	player = game.get_node("Hands/Player")
	enemy = game.get_node("Hands/Enemy")
	hearts_node = game.get_node("Control/Hearts")
	round_node = game.get_node("Control/Round")
	round_label = round_node.get_node("Count")
	
	FigureManager.generate_enemy_figures()
	InputManager.set_player(player)
	HandManager.init()
	InformationManager.init()
	BeatManager.init()
	AudioManager.start_game_music()
	
	life = TOTAL_LIFE
	half_life = false
	
	round = 0
	
	in_game = true
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
		AudioManager.play("roundLoss1")
		damage()
	else: if win == 0:
		print("Draw")
		AudioManager.play("roundLoss2")
		damage(!half_life)
	else:
		print("Win")
		AudioManager.play("roundWin")
		ScoreManager.incr_score()
		heal()

	if(life == 0):
		game_over()
		
func damage(half_damage = false):
	ShakeManager.shake(10.0,0.3)
	hearts_node.get_child(life-1).damage(half_damage)
	if(half_damage):
		half_life = true
	else:
		half_life = false
		life -= 1

func heal():
	half_life = false
	hearts_node.get_child(life-1).heal()
	
func new_round():
	round += 1
	round_label.text = str(round)
	await TimeManager.sleep_beat()
	if(in_game): enemy.set_figure("rock")
	
func game_over():
	in_game = false
	SceneManager.main.get_node("Background/Video").play()
	var colorRect = SceneManager.main.get_node("Background/ColorRect")
	colorRect.color = Color(0,0,0,0)
	game.get_node("Hands").visible = false
	await TimeManager.sleep_beat(1.0)
	AudioManager.play("glassBreak")
	await TimeManager.sleep_beat(4.0)
	SceneManager.load_score()
	
func compare(player1,player2):
	var win_state = FigureManager.get_winner(player1.figure,player2.figure)
	return win_state
