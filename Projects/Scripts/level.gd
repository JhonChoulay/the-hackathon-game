extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var window = get_window()
	
	if !Resources.windowed:
		if Resources.borderless:
			window.borderless = Resources.borderless
		else:
			window.exclusive = Resources.exclusive_fullscreen
	window.size = Vector2i(Resources.resolution[0], Resources.resolution[1])
	window.position = Vector2i(0,0)
