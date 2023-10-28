extends Control

@export var empty : Texture
@export var broken : Texture
@export var full : Texture
@export var half : Texture
@export var restore : Texture

@onready var texture_node = $Texture

func damage(half_damage = false):
#	texture_node.texture = full
	await TimeManager.sleep_beat()
	
	if(half_damage):
		texture_node.texture = half
		return
	texture_node.texture = broken
	ShakeManager.shake(2.0,0.3)
	AudioManager.play("heartBreak")
	
	await TimeManager.sleep_beat()
	texture_node.texture = empty
	
func heal():
	if(texture_node.texture == full): return
	texture_node.texture = restore
	await TimeManager.sleep_beat(0.5)
	texture_node.texture = full
