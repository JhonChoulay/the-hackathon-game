extends Control

var config = ConfigFile.new()
var res
var window_mode : int
@onready var timer = $ConfirmationPanel/Timer
@onready var res_button = get_node("ResolutionOptions")
@onready var window = get_window()
var music_slider
var audio_value

func _ready():
	#Set resolution
	var index = 0
	for i in Resources.resolutions:
		res_button.add_item(i,index)
		if Vector2i(Resources.resolutions[i]) == get_viewport().content_scale_size:
			res_button.select(index)
		index +=1
	res = get_viewport().content_scale_size
	#

	##Set window mode
	index = 0
	for i in ["Windowed","Fullscreen","Exclusive"]:
		$WindowOptions.add_item(i,index)
		if index + 2 == Resources.window_mode:
			$WindowOptions.select(index)
		index += 1
	for i in [0,3,4]:
		if i == Resources.window_mode:
			window.set_mode(i)
			window_mode = i
			break
	##

	###Set audio
	music_slider = $MusicSlider
	music_slider.value_changed.connect(_on_music_slider_value_changed)
	### 



func _on_option_button_item_selected(index):
	res = Resources.resolutions.get(res_button.get_item_text(index))

func _on_apply_button_pressed():
	get_viewport().content_scale_size = res
	window.set_mode(window_mode)
	timer.start()
	$ConfirmationPanel.visible = true

func _on_revert_button_pressed():
	#Resolution
	get_viewport().content_scale_size = Resources.resolution
	res_indexer()
	res = Resources.resolution
	#

	##Window
	window.set_mode(Resources.window_mode)
	window_indexer()
	window_mode = Resources.window_mode
	##

	###Audio
	audio_value = Resources.audio_volume
	print(Resources.audio_volume, " ", audio_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), audio_value)
	music_slider.value = audio_value
	###
	$ConfirmationPanel.visible = false

func _on_timer_timeout():
	#Resolution
	get_viewport().content_scale_size = Resources.resolution
	res_indexer()
	res = Resources.resolution
	#

	##Window Mode
	window.set_mode(Resources.window_mode)
	window_indexer()
	window_mode = Resources.window_mode
	##

	###Audio
	audio_value = Resources.audio_volume
	print(Resources.audio_volume, " ", audio_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), audio_value)
	music_slider.value = audio_value
	###
	$ConfirmationPanel.visible = false

func _on_confirm_button_pressed():
	#Resolution
	Resources.resolution = res
	config_resolution(Resources.resolution)
	#

	##Window
	Resources.window_mode = window_mode
	config_window(window_mode)
	##

	###Audio
	Resources.audio_volume = audio_value
	config.load("res://Config/config.ini")
	config.set_value("Settings","audio_volume",audio_value)
	config.save("res://Config/config.ini")
	###
	$ConfirmationPanel.visible = false

func _on_window_options_item_selected(index):
	if index != 0 :
		window_mode = index + 2
	else:
		window_mode = index

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	audio_value = value

func _on_x_button_pressed():
	res_indexer()
	window_indexer()
	music_slider.value = Resources.audio_volume
	self.visible = false



### Custom Functions ###
func config_window(window_type : int):
	config.load("res://Config/config.ini")
	config.set_value("Settings","window_mode",window_type)
	config.save("res://Config/config.ini")

func window_indexer():
	var index = 0
	for i in [0,3,4]:
		if i == Resources.window_mode:
			$WindowOptions.select(index)
		index +=1

func config_resolution(resolution_var:Vector2):
	config.load("res://Config/config.ini")
	config.set_value("Settings","screen_width",int(resolution_var.x))
	config.set_value("Settings","screen_height",int(resolution_var.y))
	config.save("res://Config/config.ini")

func res_indexer():
	var index = 0
	for i in Resources.resolutions:
		if Vector2i(Resources.resolutions[i]) == get_viewport().content_scale_size:
			res_button.select(index)
			break
		index +=1

