extends KinematicBody2D
#When game starts motion is set to Vector2, 
#Vector 2 is the position on the 2d scale. Speed of 
#player is 300. bool is basicly i linking factor to the
# direction so it just makes it easier to code and not have 
#to link it many times.
var motion = Vector2()
var speed = 300
export(String) var type
export(bool) var dir
export var direction = -1

#on start of game, initialse the following
func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	#Sets the up and down function to True the bat moves
	# up and down instead of side to side
	if type == "ud":
		$u.enabled = true 
		$d.enabled = true
		$l.enabled = false
		$r.enabled = false


# this sets the right and left fuction true and the up 
#and down action false so the bat moves left and right 
	if type == "rl":
		$r.enabled = true 
		$l.enabled = true
		$u.enabled = false
		$d.enabled = false

#Functionality of bat physics
func _physics_process(_delta):
	#chnages bat direction (left or right) when it collides
	# with object
	if $l.get_collider():
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	
	
	if $r.get_collider():
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	
	
	# when ud typed, bat moves up or down
	if type == "ud":
		if $u.is_colliding() == true && $u.get_collider().get("TYPE") ==  null && dir == true:
			dir = false
		if $d.is_colliding() == true && $d.get_collider().get("TYPE") ==  null && dir == false:
			dir = true
		if dir == true:
			motion.y = -speed
		if dir == false:
			motion.y = speed
	
	# # when rl is typed, the bat will move right or left
	if type == "rl":
		if $r.is_colliding() == true && $r.get_collider().get("TYPE") == null && dir == true:
			dir = false
		if $l.is_colliding() == true && $l.get_collider().get("TYPE") ==  null && dir == false:
			dir = true
		if dir == true:
			motion.x = speed
		if dir == false:
			motion.x = -speed
	
	
	
	motion = move_and_slide(motion)
# this means that when the plaer enters the collsion of the bat 
#the player will go to the global position.
func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "player":
		if Checkpoints2.spawn:
			body.global_position = Checkpoints2.spawn
		
