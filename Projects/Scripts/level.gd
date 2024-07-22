extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var window = get_window()
	if !Resources.windowed:
		if Resources.borderless:
			window.borderless = Resources.borderless
		else:
			window.exclusive = Resources.exclusive_fullscreen
	get_viewport().content_scale_size = Resources.resolution
