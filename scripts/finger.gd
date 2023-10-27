extends Sprite2D

@export var folded_texture: Texture
@export var unfolded_texture: Texture

func fold():
	texture = folded_texture
	
func unfold():
	texture = unfolded_texture
