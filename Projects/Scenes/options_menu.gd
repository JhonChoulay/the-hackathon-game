extends Node2D

func _on_resolution_list_item_selected(index):
	var config = ConfigFile.new()
	config.load("res://Config/config.ini")
	match index:
		0:
			config.set_value("Settings","screen_width",1920)
			config.set_value("Settings","screen_height",1080)
			config.save("res://Config/config.ini")
		1:
			config.set_value("Settings","screen_width",1080)
			config.set_value("Settings","screen_height",720)
			config.save("res://Config/config.ini")
		_:
			print("err")
