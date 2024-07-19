extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	resize()
	get_node("Buttons/OptionsMenu/Container/ApplyButton").pressed.connect(on_apply_button_pressed)

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
	var sprite : Array = [$Sprite.texture.get_width(),$Sprite.texture.get_height()]
	scale.x = float(resolution[0]) / float(sprite[0])
	scale.y = float(resolution[1]) / float(sprite[1])
	position = Vector2(resolution[0] / 2, resolution[1] / 2)

