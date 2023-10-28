extends Control

@export var empty : Texture
@export var broken : Texture
@export var full : Texture

@onready var texture_node = $Texture

func damage():
	texture_node.texture = full
	await TimeManager.sleep_beat()
	texture_node.texture = broken
	await TimeManager.sleep_beat()
	texture_node.texture = empty
