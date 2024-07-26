extends Node2D

var config = ConfigFile.new()
var resolution : Vector2
var window_mode : int
var resolutions : Dictionary = {
	"3840x2160": Vector2(3840, 2160),  # 4K UHD
	"2560x1440": Vector2(2560, 1440),  # QHD
	"1920x1080": Vector2(1920, 1080),  # Full HD
	"1600x900": Vector2(1600, 900),    # HD+
	"1440x900": Vector2(1440, 900),    # WXGA+
	"1366x768": Vector2(1366, 768),    # WXGA
	"1280x1024": Vector2(1280, 1024),  # SXGA
	"1280x800": Vector2(1280, 800),    # WXGA
	"1280x720": Vector2(1280, 720),    # HD
	"1024x768": Vector2(1024, 768),    # XGA
	"1024x600": Vector2(1024, 600),    # WSVGA
	"800x600": Vector2(800, 600),      # SVGA
	"640x480": Vector2(640, 480)       # VGA
}
var music_volume
var master_volume
var sfx_volume

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://Config/config.ini")
	resolution  = Vector2(config.get_value("Settings","screen_width"), config.get_value("Settings","screen_height"))
	window_mode = config.get_value("Settings","window_mode")
	music_volume = config.get_value("Settings","music_volume")
	master_volume = config.get_value("Settings","master_volume")
	sfx_volume = config.get_value("Settings","sfx_volume")
	get_viewport().content_scale_size = Vector2(resolution[0],resolution[1])
