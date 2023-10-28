extends Node

var player
var enemy

func init():
	player = GameManager.game.get_node("Hands/Player")
	enemy = GameManager.game.get_node("Hands/Enemy")
	
func beat(pause = false):
	player.beat(pause)
	enemy.beat(pause)
