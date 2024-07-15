extends CharacterBody2D
class speed_class:
	var x = 0
	var y = 0
	@export var loss = 5
	@export var gain = 5
	@export var maximum = 400

var speed = speed_class.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var resolution = get_viewport().get_visible_rect()
	position = Vector2(resolution.size[0]/2, resolution.size[1]/2)	# Place the player in the middle of the screen.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity_calc(direction)
	velocity = Vector2(speed.x,speed.y)
	move_and_slide()

func velocity_calc(direction_var):
											## X axis speed and velocity management
	if direction_var.x != 0: #If moving
		speed.x += direction_var.x * speed.gain #Gain speed on the respective X axis direction_var (if negative direction_var = left)
	else: #if left or right are not pressed
		if speed.x < 0: #if the speed is going to the left
			if speed.x <= -speed.loss: 
				speed.x += speed.loss #Start losing speed
			else:
				speed.x = 0
		elif speed.x > 0:#if the speed is going to the right
			if speed.x >= speed.loss:
				speed.x -= speed.loss #Start losing speed
			else:
				speed.x = 0				## End of X axis management
	if abs(speed.x) > speed.maximum:
		speed.x = direction_var.x * speed.maximum

#Similar or same actions on y axis

	if direction_var.y != 0:					## Y axis speed and velocity management
		speed.y += direction_var.y * speed.gain #Gain speed on the respective y axis direction_var (if negative direction_var = left)
	else: #if left or right are not pressed
		if speed.y < 0: #if the speed is going to the left
			if speed.y <= -speed.loss: 
				speed.y += speed.loss #Start losing speed
			else:
				speed.y = 0
		elif speed.y > 0:#if the speed is going to the right
			if speed.y >= speed.loss:
				speed.y -= speed.loss #Start losing speed
			else:
				speed.y = 0				## End of y axis management
	if abs(speed.y) > speed.maximum:
		speed.y = direction_var.y * speed.maximum
