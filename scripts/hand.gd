extends Node2D

var figure = "unmatch"
#var fingers = [false,false,false,false,false]
var fingers = {
	"thumb" : false, 
	"index" : false,
	"middle" : false,
	"ring" : false,
	"pinky" : false
}

@onready var finger_nodes = {
	"thumb" : $Sprite/Thumb, 
	"index" : $Sprite/Index,
	"middle" : $Sprite/Middle,
	"ring" : $Sprite/Ring,
	"pinky" : $Sprite/Pinky
}

func _ready():
	figure = FiguresManager.get_figure(fingers)
#	print(finger_nodes)

func fold(finger):
	fingers[finger] = true
	finger_nodes[finger].fold()
	figure = FiguresManager.get_figure(fingers)
	
func unfold(finger):
	fingers[finger] = false
	finger_nodes[finger].unfold()
	figure = FiguresManager.get_figure(fingers)
