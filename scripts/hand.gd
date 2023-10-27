extends Node2D

var figure = "unmatch"
var default_rotation = -45.0
var beat_rotation = -105.0
var rotation_position = 1.0
var fingers = {
	"thumb" : false, 
	"index" : false,
	"middle" : false,
	"ring" : false,
	"pinky" : false
}

@onready var finger_nodes = {
	"thumb" : $Anchor/Sprite/Thumb, 
	"index" : $Anchor/Sprite/Index,
	"middle" : $Anchor/Sprite/Middle,
	"ring" : $Anchor/Sprite/Ring,
	"pinky" : $Anchor/Sprite/Pinky
}

@onready var anchor = $Anchor

func _ready():
	figure = FiguresManager.get_figure(fingers)
	
func _process(delta):
	restore_rotation(delta)

func fold(finger):
	fingers[finger] = true
	finger_nodes[finger].fold()
	figure = FiguresManager.get_figure(fingers)
	
func unfold(finger):
	fingers[finger] = false
	finger_nodes[finger].unfold()
	figure = FiguresManager.get_figure(fingers)
	
func beat():
	anchor.rotation = deg_to_rad(beat_rotation)
	rotation_position = 0
	
func restore_rotation(delta):
	if(rotation_position > 1): return
	rotation_position += delta
	anchor.rotation = lerp(anchor.rotation, deg_to_rad(default_rotation), deg_to_rad(rotation_position))
	
