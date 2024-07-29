extends AudioStreamPlayer

const menu_music = preload("res://Sound/Music/Main-Menu.mp3")

func _play_audio(music_location : AudioStream, volume = 0.0):
	if stream:
		stream = music_location
		volume_db = volume
		play()
		stream.loop = true

func _play_menu_music():
	_play_audio(menu_music)
