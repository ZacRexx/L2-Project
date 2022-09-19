extends KinematicBody2D
# varable and export is saying that when the game starts all these 
#action will apply 
var motion = Vector2()
var speed = 50
export(String) var type
export(bool) var dir
export var direction = 1
#onready var starting_spawn = $StartingSpawn
#when snail is ready these action will apply. When snail is
# moving face the direction it is moving
func _ready():
	if dir == false:
		$AnimatedSprite.flip_h = true




	if type == "d":
		$d.enabled = true
	
	# function physics that will apply to thew snail. When the 
	#snail collides with a object the direction will it is moving 
	#will flip right or left it will also  flip and the way the snail
	# is facing.
func _physics_process(_delta):
	if $d.is_colliding() == false:
		dir = false 
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	if $d2.is_colliding() == false:
		dir = true 
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	if dir == true:
		motion.x = -speed
	
	if dir == false:
		motion.x = speed

	
	
	motion = move_and_slide(motion)
#when player enters the collsion of the snail the player will go to its 
#global spawn.
func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "player":
		if Checkpoints2.spawn:
			body.global_position = Checkpoints2.spawn
		#else:
			#body.global_position = starting_spawn.global_position
