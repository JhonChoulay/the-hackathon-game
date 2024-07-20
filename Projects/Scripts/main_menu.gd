extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	resize()
	get_node("OptionsMenu/ApplyButton").pressed.connect(on_apply_button_pressed)

func on_apply_button_pressed():
	get_viewport().content_scale_size = Vector2(Resources.resolution[0],Resources.resolution[1])
	resize()

func resize():
	var resolution = Resources.resolution
	if !Resources.windowed:
		if Resources.borderless:
			get_window().borderless = Resources.borderless
		else:
			get_window().exclusive = Resources.exclusive_fullscreen


