extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var resolution = get_viewport().get_visible_rect()
	var sprite : Array = [$Sprite.texture.get_width(),$Sprite.texture.get_height()]
	scale.x = float(resolution.size[0]) / float(sprite[0])
	scale.y = float(resolution.size[1]) / float(sprite[1])
	position = Vector2(resolution.size[0] / 2, resolution.size[1] / 2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
