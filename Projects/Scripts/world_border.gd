extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	change_pos()

func _on_level_settings_changed():
	change_pos()


###Custom functions
func change_pos():
	for node in get_children():
		match node.name:
			"Left":
				node.position = Vector2(0,Resources.resolution[1]/2)
				node.shape.size = Vector2(1,Resources.resolution[1])
			"Right":
				node.position = Vector2(Resources.resolution[0],Resources.resolution[1]/2)
				node.shape.size = Vector2(1,Resources.resolution[1])
			"Up":
				node.position = Vector2(Resources.resolution[0]/2,0)
				node.shape.size = Vector2(Resources.resolution[0],1)
			"Down":
				node.position = Vector2(Resources.resolution[0]/2,Resources.resolution[1])
				node.shape.size = Vector2(Resources.resolution[0],1)
