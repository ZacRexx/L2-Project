extends KinematicBody2D
# These are the varablies that are applied to the game 
#when you start like where the player  will start. basicly
# the laws of the game
const TYPE = "player"
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 600
const MAXSPEED = 300
const JUMPFORCE = 600
const ACCEL = 42
var motion = Vector2.ZERO
var facing_right = true





# this is the functionalty of the player and what code applies to its physics.
func _physics_process(_delta):
	
	
	# Varible for player postion is vector2 this is the 2d postion of the player
	var _input_vector = Vector2.ZERO
	# Gravity is applied to the player 
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	#The facing direction of the player model depending on the scale for
	# left and right 
	if facing_right == true:
		$AnimatedSprite.scale.x = 1 
	
	else:
		$AnimatedSprite.scale.x = -1
	
	# this is putting a cap on the most acceleration that the player can have
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	# When imput action right or left is pressed the player will go in the 
	#direction.
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$AnimatedSprite.play("run") 

	
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$AnimatedSprite.play("run")
	# If left or right is not being pressed than the motion of the player will
	# be idle. When jump is pushed the player will jump.
	else:
		motion.x = lerp(motion.x,0,0.2)
		$AnimatedSprite.play("idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"): 
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP)
	
	# When on floor the motion jump canbe active and the fall
	# motion will be off
	if !is_on_floor():
		if motion.y < 0:
			$AnimatedSprite.play("jump")
		elif motion.y > 0:
			$AnimatedSprite.play("fall")
	
	



