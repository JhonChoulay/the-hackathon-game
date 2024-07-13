extends CharacterBody2D
class speed_class:
	var x = 0
	var y = 0
	@export var loss = 5
	@export var gain = 5
	@export var max = 100

var speed = speed_class.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640,360) # Place in the middle of the screen.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity_calc(direction,speed)
	print(speed.y," ", direction.y)
	velocity = Vector2(speed.x,speed.y)
	move_and_slide()

func velocity_calc(direction, speed):
											## X axis speed and velocity management
	if direction.x != 0: #If moving
		speed.x += direction.x * speed.gain #Gain speed on the respective X axis direction (if negative direction = left)
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

#Similar or same actions on y axis

	if direction.y != 0:					## Y axis speed and velocity management
		speed.y += direction.y * speed.gain #Gain speed on the respective y axis direction (if negative direction = left)
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
			speed.y -= speed.loss 			## End of Y axis management
