extends Node2D

var config = ConfigFile.new()
var resolution : Vector2
var window_mode : int
var resolutions : Dictionary = {
	"1920x1080":Vector2(1920,1080),
	"1600x900":Vector2(1600,900),
	"1280x720":Vector2(1280,720),
	"1024x600":Vector2(1024,600),
	"800x600":Vector2(800,600)}


# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://Config/config.ini")
	resolution  = Vector2(config.get_value("Settings","screen_width"), config.get_value("Settings","screen_height"))
	window_mode = config.get_value("Settings","window_mode")
	get_viewport().content_scale_size = Vector2(resolution[0],resolution[1])
