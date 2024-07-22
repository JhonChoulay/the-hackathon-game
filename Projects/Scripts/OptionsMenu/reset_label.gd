extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false



func _on_timer_timeout():
	self.visible = false
