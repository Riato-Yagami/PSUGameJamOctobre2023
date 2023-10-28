extends Label

@onready var name_label = $Name

func _ready():
	set_name_label("cul")
	
func set_name_label(str):
	name_label.text = ""
	for char in str:
		name_label.text += char + " "
		
func set_score(value):
	text = str(value)
