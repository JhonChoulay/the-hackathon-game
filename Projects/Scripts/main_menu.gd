extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var resolution = Resources.resolution
	var sprite : Array = [$Sprite.texture.get_width(),$Sprite.texture.get_height()]
	scale.x = float(resolution[0]) / float(sprite[0])
	scale.y = float(resolution[1]) / float(sprite[1])
	position = Vector2(resolution[0] / 2, resolution[1] / 2)
	if !Resources.windowed:
		if Resources.borderless:
			get_window().borderless = Resources.borderless
		else:
			get_window().exclusive = Resources.exclusive_fullscreen
	get_window().size = Vector2i(resolution[0], resolution[1])
	get_window().position = Vector2i(0,0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
