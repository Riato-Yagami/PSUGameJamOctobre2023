extends ColorRect

var defaultColor
var color_position = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	defaultColor = modulate


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(modulate != defaultColor): color_position = 0
	if color_position < 1:
		color_position+= delta
		modulate.r = lerp(modulate.r, defaultColor.r, color_position)
		modulate.g = lerp(modulate.g, defaultColor.g, color_position)
		modulate.b = lerp(modulate.b, defaultColor.b, color_position)
		modulate.a = lerp(modulate.a, defaultColor.a, color_position)
