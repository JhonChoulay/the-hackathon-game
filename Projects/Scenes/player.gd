extends CharacterBody2D

var x_speed = 0
var y_speed = 0
@export var speed_loss = 2
@export var speed_gain = 5
@export var max_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640,360) # Place in the middle of the screen.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity_calc(direction)
	print(y_speed," ", direction.y)
	velocity = Vector2(x_speed,y_speed)
	move_and_slide()

func velocity_calc(direction):
											## X axis speed and velocity management
	if direction.x != 0: #If moving
		x_speed += direction.x * speed_gain #Gain speed on the respective X axis direction (if negative direction = left)
	else: #if left or right are not pressed
		if x_speed < 0: #if the speed is going to the left
			if x_speed <= -speed_loss: 
				x_speed += speed_loss #Start losing speed
			else:
				x_speed = 0
		elif x_speed > 0:#if the speed is going to the right
			if x_speed >= speed_loss:
				x_speed -= speed_loss #Start losing speed
			else:
				x_speed = 0				## End of X axis management

#Similar or same actions on y axis

	if direction.y != 0:					## Y axis speed and velocity management
		y_speed += direction.y * speed_gain #Gain speed on the respective y axis direction (if negative direction = left)
	else: #if left or right are not pressed
		if y_speed < 0: #if the speed is going to the left
			if y_speed <= -speed_loss: 
				y_speed += speed_loss #Start losing speed
			else:
				y_speed = 0
		elif y_speed > 0:#if the speed is going to the right
			if y_speed >= speed_loss:
				y_speed -= speed_loss #Start losing speed
			else:
				y_speed = 0				## End of y axis management
			y_speed -= speed_loss 			## End of Y axis management
