extends RichTextLabel

@onready var timer= get_parent().get_node("Timer")
@export var font_size : int = 20

func _on_apply_button_pressed():
	append_text("10")

func _process(_delta):
	var temp_text = "[center] [font_size= {size}]Video settings reset in: %s[/font_size][/center]" % timer.time_left ###pog
	text = temp_text.format({"size":font_size})
