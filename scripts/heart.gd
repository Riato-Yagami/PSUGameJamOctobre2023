extends Control

@export var empty : Texture
@export var broken : Texture
@export var full : Texture
@export var half : Texture

@onready var texture_node = $Texture

func damage(half_damage = false):
#	texture_node.texture = full
	await TimeManager.sleep_beat()
	
	if(half_damage):
		texture_node.texture = half
		return
	texture_node.texture = broken
	ShakeManager.shake(2.0,0.3)
	
	await TimeManager.sleep_beat()
	texture_node.texture = empty
	
func heal():
	texture_node.texture = full
