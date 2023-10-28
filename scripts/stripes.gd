extends Control

const MIN_SCROLL = -1000
const MAX_SCROLL = 1000

const SPEED = 200
const OFFSET = 1000

const Y_POS = -400

@onready var stripe_scene = preload("res://scenes/stripe.tscn")
var stripes = []

func _ready():
	spawn_stripe()
	spawn_stripe(OFFSET)

func spawn_stripe(offset = 0):
	var stripe = stripe_scene.instantiate()
	stripes.append(stripe)
	add_child(stripe)
	
	stripe.position = Vector2(MIN_SCROLL + offset,Y_POS)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for stripe in stripes:
		move_stripe(stripe,delta)
		
func move_stripe(stripe,delta):
	stripe.position.x += delta * SPEED
	if(stripe.position.x > MAX_SCROLL):
		stripe.position.x = MIN_SCROLL
