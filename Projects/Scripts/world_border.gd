extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var resolution = Resources.resolution
	for node in get_children():
		match node.name:
			"Left":
				node.position = Vector2(0,resolution[1]/2)
				node.shape.size = Vector2(1,resolution[1])
			"Right":
				node.position = Vector2(resolution[0],resolution[1]/2)
				node.shape.size = Vector2(1,resolution[1])
			"Up":
				node.position = Vector2(resolution[0]/2,0)
				node.shape.size = Vector2(resolution[0],1)
			"Down":
				node.position = Vector2(resolution[0]/2,resolution[1])
				node.shape.size = Vector2(resolution[0],1)
