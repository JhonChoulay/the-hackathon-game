extends Control

var config = ConfigFile.new()
var res
var window_mode : int
@onready var timer = $ConfirmationPanel/Timer
@onready var res_button = get_node("ResolutionOptions")
@onready var window = get_window()
var music_slider
var master_slider
var sfx_slider
var music_volume = 0
var master_volume = 0
var sfx_volume = 0

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
	master_slider = $MasterSlider
	sfx_slider = $SFXSlider
	music_slider.value_changed.connect(_on_music_slider_value_changed)
	master_slider.value_changed.connect(_on_master_slider_value_changed)
	sfx_slider.value_changed.connect(_on_sfx_slider_value_changed)
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
	music_volume = Resources.music_volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_volume)
	music_slider.value = music_volume
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
	music_volume = Resources.music_volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_volume)
	music_slider.value = music_volume
	###
	$ConfirmationPanel.visible = false

func _on_confirm_button_pressed():
	config.load("res://Config/config.ini")
	
	###Resolution
	Resources.resolution = res
	config.set_value("Settings","screen_width",int(res.x))
	config.set_value("Settings","screen_height",int(res.y))
	###
	##Window
	Resources.window_mode = window_mode
	config.set_value("Settings","window_mode",window_mode)
	##
	#Audio
	Resources.music_volume = music_volume
	Resources.master_volume = master_volume
	Resources.sfx_volume = sfx_volume
	config.set_value("Settings","music_volume",music_volume)
	config.set_value("Settings","master_volume",master_volume)
	config.set_value("Settings","sfx_volume",sfx_volume)
	#
	
	config.save("res://Config/config.ini")
	$ConfirmationPanel.visible = false

func _on_window_options_item_selected(index):
	if index != 0 :
		window_mode = index + 2
	else:
		window_mode = index

###Audio
func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	music_volume = value

func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	master_volume = value

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	sfx_volume = value
###

func _on_x_button_pressed():
	res_indexer()
	window_indexer()
	music_slider.value = Resources.music_volume
	master_slider.value = Resources.master_volume
	sfx_slider.value = Resources.sfx_volume
	self.visible = false


### Custom Functions ###

func window_indexer():
	var index = 0
	for i in [0,3,4]:
		if i == Resources.window_mode:
			$WindowOptions.select(index)
		index +=1

func res_indexer():
	var index = 0
	for i in Resources.resolutions:
		if Vector2i(Resources.resolutions[i]) == get_viewport().content_scale_size:
			res_button.select(index)
			break
		index +=1

