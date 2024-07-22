extends Control

var resolutions : Dictionary = {
	"1920x1080":Vector2(1920,1080),
	"1600x900":Vector2(1600,900),
	"1280x720":Vector2(1280,720),
	"1024x600":Vector2(1024,600),
	"800x600":Vector2(800,600)}

var config = ConfigFile.new()
var res
var ex_res
@onready var timer = $ConfirmationPanel/Timer
@onready var res_button = get_node("ResolutionOptions")

func _ready():
	var index = 0
	for i in resolutions:
		res_button.add_item(i,index)
		if Vector2i(resolutions[i]) == get_viewport().content_scale_size:
			res_button.select(index)
		index +=1
	res = get_viewport().content_scale_size
	ex_res = res

func _on_option_button_item_selected(index):
	res = resolutions.get(res_button.get_item_text(index))

func _on_apply_button_pressed():
	get_viewport().content_scale_size = res
	timer.start()
	config_resolution(res)
	Resources.resolution = res
	$ConfirmationPanel.visible = true

func _on_revert_button_pressed():
	config_resolution(ex_res)
	Resources.resolution = res
	get_viewport().content_scale_size = ex_res
	res_indexer()
	res = get_viewport().content_scale_size
	$ConfirmationPanel.visible = false

func _on_timer_timeout():
	config_resolution(ex_res)
	Resources.resolution = res
	get_viewport().content_scale_size = ex_res
	res_indexer()
	res = get_viewport().content_scale_size
	$ConfirmationPanel.visible = false

func _on_confirm_button_pressed():
	$ConfirmationPanel.visible = false
	ex_res = res

### Custom Functions ###
func config_resolution(resolution_var:Vector2):
	config.load("res://Config/config.ini")
	config.set_value("Settings","screen_width",int(resolution_var.x))
	config.set_value("Settings","screen_height",int(resolution_var.y))
	config.save("res://Config/config.ini")

func res_indexer():
	var index = 0
	for i in resolutions:
		if Vector2i(resolutions[i]) == get_viewport().content_scale_size:
			res_button.select(index)
		index +=1
