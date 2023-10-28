extends Node

#var finger_names = ["thumb", "index", "middle", "ring", "pinky"]
var figures = { # thumb, index, middle, ring, pinky
	# fold = 1 , unfold = 0
	"rock" : [1,1,1,1,1],
	"paper" : [0,0,0,0,0],
	"cisors" : [1,0,0,1,1],
}

var playoff_matrix = [
	[0,-1,1],
	[1,0,-1],
	[-1,1,0]
]

var enemy_figures = []
var enemy_figures_count = 100

func get_figure(fingers):
	var simplified_array = []
	for finger in fingers:
		simplified_array.append(1 if fingers[finger] else 0)
	
#	print(simplified_array)
	for figure in figures:
		if simplified_array == figures[figure]: return figure
	
	return "unmatch"
	
func get_fingers(figure):
	return figures[figure]
	
func get_key_index(dictionnary,key):
	var i = 0
	for k in dictionnary:
		if key == k : return i
		i+=1
		
func get_winner(figure1,figure2): # 1 player 1 won ; -1 lost ; 0 draw
	print(figure1 + " vs " + figure2)
	var figure_index_1 = get_key_index(figures,figure1)
	var figure_index_2 = get_key_index(figures,figure2)
	print(str(figure_index_1) + " vs " + str(figure_index_2))
	
	if figure_index_1 == null: return -1
	if figure_index_1 == null: return 1
	
	var state
	state = playoff_matrix[figure_index_1][figure_index_2]
	return state
#	return
#	if (figure_index_1 > figure_index_2):
#		state = -playoff_matrix[figure_index_2][figure_index_1]
#	else:
#		state = playoff_matrix[figure_index_1][figure_index_2]
#	return state
	
func generate_enemy_figures():
	for i in range(enemy_figures_count):
		enemy_figures.append(figures.keys().pick_random())
		
func get_enemy_figure(round):
	return enemy_figures[round]
	
