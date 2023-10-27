extends Node

var player
var enemy

func _ready():
	player = GameManager.game.get_node("Hands/Player")
	enemy = GameManager.game.get_node("Hands/Enemy")
	
func beat():
	player.beat()
	enemy.beat()
