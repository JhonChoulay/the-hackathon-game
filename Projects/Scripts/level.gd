extends Node

signal settings_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().content_scale_size = Resources.resolution

func _input(_event):
	if Input.is_action_just_pressed("F11") or (Input.is_action_pressed("Alt") and Input.is_action_pressed("Enter")):
		get_window().content_scale_size = DisplayServer.screen_get_size()
		Resources.window_mode = 3
		Resources.resolution = DisplayServer.screen_get_size()
		get_window().set_mode(Window.MODE_FULLSCREEN)
		var config = ConfigFile.new()
		config.load("res://Config/config.ini")
		config.set_value("Settings","screen_width",Resources.resolution.x)
		config.set_value("Settings","screen_height",Resources.resolution.y)
		config.set_value("Settings","window_mode", 3)
		config.save("res://Config/config.ini")
		settings_changed.emit()
