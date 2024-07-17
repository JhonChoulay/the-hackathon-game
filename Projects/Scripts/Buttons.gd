extends Control

func _on_new_game_pressed():
	print("NG Pressed")
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	print("NG Pressed")

func _on_continue_pressed():
	print("NG Pressed")
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	print("NG Pressed")

func _on_options_pressed():
	
	pass

func _on_exit_pressed():
	get_tree().quit();
