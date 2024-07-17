extends Node2D

var config = ConfigFile.new()
var resolution : Array
var borderless : bool
var exclusive_fullscreen : bool
var windowed : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://Config/config.ini")
	resolution  = [config.get_value("Settings","screen_width"), config.get_value("Settings","screen_height")]
	windowed = config.get_value("Settings","windowed")
	borderless = config.get_value("Settings", "borderless")
	exclusive_fullscreen = config.get_value("Settings", "exclusive_fullscreen")
