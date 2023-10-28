extends Node2D

var figure = "unmatch"
var default_rotation = 250
var beat_rotation = -105.0
var pause_beat_rotation = -50
var rotation_position = 1.0
var beat_pause = false

var rotation_speed = 3

var fingers = {
	"thumb" : true, 
	"index" : true,
	"middle" : true,
	"ring" : true,
	"pinky" : true
}

@onready var finger_nodes = {
	"thumb" : $Anchor/Sprite/Thumb, 
	"index" : $Anchor/Sprite/Index,
	"middle" : $Anchor/Sprite/Middle,
	"ring" : $Anchor/Sprite/Ring,
	"pinky" : $Anchor/Sprite/Pinky
}

@onready var anchor = $Anchor
@onready var player_sprite = $Player
@onready var crown = $Crown

const FADE_SPEED = 0.2

func win():
	crown.visible = true
	await TimeManager.sleep_beat(2)
	crown.visible = false
	
func show_player_sprite():
	player_sprite.modulate = Color(1,1,1,1)
	
func _ready():
	figure = FigureManager.get_figure(fingers)
	set_figure(figure)
	
func _process(delta):
	if(GameManager.in_game): restore_rotation(delta)
	
	if(player_sprite.modulate.a > 0):
		player_sprite.modulate.a -= delta * FADE_SPEED
	else: player_sprite.modulate.a = 0

func fold(finger):
	fingers[finger] = true
	finger_nodes[finger].fold()
	figure = FigureManager.get_figure(fingers)
	
func unfold(finger):
	fingers[finger] = false
	finger_nodes[finger].unfold()
	figure = FigureManager.get_figure(fingers)
	
func beat(pause = false):
	beat_pause = pause
	anchor.rotation = deg_to_rad(beat_rotation)
	rotation_position = 0
	
func restore_rotation(delta):
	if(rotation_position > 1 or beat_pause): return
	rotation_position += delta * rotation_speed * AudioManager.get_speed_factor()
	anchor.rotation = lerp(anchor.rotation, deg_to_rad(default_rotation), deg_to_rad(rotation_position))

func set_figure(new_figure):
	figure = new_figure
	var new_fingers = FigureManager.get_fingers(figure)
	
	var finger_index = 0
	for finger in fingers:
		if new_fingers[finger_index]: fold(finger)
		else: unfold(finger)
		finger_index+=1
		
	
