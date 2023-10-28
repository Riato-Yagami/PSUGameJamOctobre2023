extends Label

#func _ready():
#	set_name_label("cul")
	
func set_player_name(str):
	var name_label = $Name
	name_label.text = str
#	for char in str:
#		name_label.text += char + " "
		
func set_score(value):
	text = str(value)
