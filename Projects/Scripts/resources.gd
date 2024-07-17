extends Node2D

var config = ConfigFile.new()
var resolution : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://Config/config.ini")
	resolution  = [config.get_value("Settings","screen_width"), config.get_value("Settings","screen_height")]
