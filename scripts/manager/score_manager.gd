extends Node

var score_node
var new_score_label
var in_score

var score = 0
var top_node
var top_score_scene
var name_node
var player_name = ""
var reset_scores = false

func incr_score():
	score += 1
	await TimeManager.sleep_beat(2.0)
	BeatManager.increase_bpm()

func reset():
	score = 0
	
func init():
	score_node = SceneManager.scene_node.get_node("Score")
	
	name_node = score_node.get_node("Control/Name")
	name_node.text = player_name
	new_score_label = score_node.get_node("Control/NewScore")
	top_node = score_node.get_node("Control/Top/TopGrid")
	top_score_scene = load("res://scenes/topScore.tscn")
	
	new_score_label.text = str(score)
	in_score = true
	if(reset_scores): delete_save()
	
	
func _input(event):
	if(in_score):
		if event is InputEventKey and event.is_pressed():
			var key_text = OS.get_keycode_string(event.keycode)
			if(key_text == "Backspace"):
				player_name = player_name.substr(0,max(0,player_name.length()-2))
			if(key_text == "Enter" and player_name.length() >= 6):
				save_new_score()
				set_top()
			else: if(name_node.text.length() < 6 and key_text.length() == 1):
				player_name += key_text + " "
			name_node.text = player_name

func delete_save():
	save("")
	
func save_new_score():
	var new_score = player_name + "," + str(score)
	var scores = load_scores()
	if(scores == ""): scores = new_score
	else: scores += ";" + new_score
	
#	print(scores)
	save(scores)
	
func load_scores():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func custom_sort(a, b):
	return int(a[1]) < int(b[1])
	
func set_top():
	name_node.visible = false
	score_node.get_node("Control/EnterName").visible = false
	var scores = load_scores()
	scores = scores.split(";")
	
	var scores_matrix = []
	for score in scores:
		scores_matrix.append(score.split(","))

	scores_matrix.sort_custom(custom_sort)
	scores_matrix.reverse()
#	print(scores_matrix)
	
	for i in range(min(7,scores_matrix.size())):
		if(int(scores_matrix[i][1]) > 0):
			add_top(scores_matrix[i])

#var save_path = "user://save/score.txt"
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i) + ";"
	return s.substr(0,s.length()-1)

func save(content):
#	print(content)
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)
	
func add_top(score):
	print(score)
#	return
	var top = top_score_scene.instantiate()
	top.set_score(int(score[1]))
	top.set_player_name(score[0])
	top_node.add_child(top)
