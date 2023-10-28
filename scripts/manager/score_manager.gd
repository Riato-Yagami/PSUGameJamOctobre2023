extends Node

var score_node
var new_score_label
var in_score

var score = 0
var top = [0,0,0,0,0]
var top_node
var top_score_scene

var reset_top = false

func incr_score():
	score += 1
	await TimeManager.sleep_beat(2.0)
	BeatManager.increase_bpm()
func init():
	score_node = SceneManager.scene_node.get_node("Score")
	
#	score = GameManager.round - 3
	
	new_score_label = score_node.get_node("Control/NewScore")
	top_node = score_node.get_node("Control/Top")
	top_score_scene = load("res://scenes/topScore.tscn")
	
	new_score_label.text = str(score)
	in_score = true
	if(!reset_top): top = load_score()
	set_top()
	
func set_top():
	top.sort()
	for scr in top:
		if(score > scr):
			print(top)
			top.append(score)
			break;
			
	top.sort()
	top.remove_at(0)
#	top.remove_at(top.size()-1)
	top.reverse()
	
	for scr in top:
		if(scr != 0): add_top(scr)
	print(top)
	
	save(array_to_string(top))

#var save_path = "user://save/score.txt"
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i) + ","
	return s.substr(0,s.length()-1)

func save(content):
	print(content)
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load_score():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	content = content.split(",")
	print(content)
	print(content[0])
	var int_content = [0,0,0,0,0]
	for i in range(content.size()-1):
		int_content[i] = int(content[i])
	return int_content
	
func add_top(score):
	var top = top_score_scene.instantiate()
	top.set_score(score)
	top_node.add_child(top)
