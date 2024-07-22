extends Node2D

var config = ConfigFile.new()
var resolution : Vector2
var window_mode : int

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://Config/config.ini")
	resolution  = Vector2(config.get_value("Settings","screen_width"), config.get_value("Settings","screen_height"))
	window_mode = config.get_value("Settings","window_mode")
	get_viewport().content_scale_size = Vector2(resolution[0],resolution[1])
