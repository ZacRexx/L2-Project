extends Node2D
#Onready player will be the player node
onready var player = $player
#When funtion is ready the checkpoint will be thew global postion of the player.
func _ready():
	if Checkpoints2.spawn:
		player.global_position = Checkpoints2.spawn
