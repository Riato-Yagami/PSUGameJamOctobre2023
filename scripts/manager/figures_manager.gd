extends Node

#var finger_names = ["thumb", "index", "middle", "ring", "pinky"]
var figures = { # thumb, index, middle, ring, pinky
	# fold = 1 , unfold = 0
	"rock" : [1,1,1,1,1],
	"paper" : [0,0,0,0,0],
	"cisors" : [1,0,0,1,1],
}

func get_figure(fingers):
	var simplified_array = []
	for finger in fingers:
		simplified_array.append(1 if fingers[finger] else 0)
	
	print(simplified_array)
	for figure in figures:
		if simplified_array == figures[figure]: return figure
	
	return "unmatch"
