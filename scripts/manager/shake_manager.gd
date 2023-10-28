extends Node

var shake_amount = 0
var camera

func shake(amount, time = 0):
	shake_amount += amount
	if(time > 0):
		await TimeManager.sleep(time)
		shake_amount -= amount
	
func _ready():
	camera = SceneManager.main.get_node("Camera")
	
func _process(delta):
	camera.set_offset(Vector2(randf_range(-1.0, 1.0) * shake_amount, randf_range(-1.0, 1.0) * shake_amount))
