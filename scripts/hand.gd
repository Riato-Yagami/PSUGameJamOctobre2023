extends Node2D

#var fingers = [false,false,false,false,false]
var fingers = {
	"thumb" : false, 
	"index" : false,
	"middle" : false,
	"ring" : false,
	"pinky" : false
}

func fold(finger):
	fingers[finger] = true
	print(FiguresManager.get_figure(fingers))
	
func unfold(finger):
	fingers[finger] = false
	print(FiguresManager.get_figure(fingers))
