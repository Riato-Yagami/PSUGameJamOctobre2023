extends ColorRect

var defaultColor
var color_position = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	defaultColor = color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(color != defaultColor): color_position = 0
	if color_position < 1:
		color_position+= delta
		color.r = lerp(color.r, defaultColor.r, color_position)
		color.g = lerp(color.g, defaultColor.g, color_position)
		color.b = lerp(color.b, defaultColor.b, color_position)
		color.a = lerp(color.a, defaultColor.a, color_position)
