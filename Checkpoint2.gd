extends Area2D



# this is telling the game that when the checkpoint body
# is entered the postion of this body will now become the global postion
#x for the player
func _on_Checkpoint2_body_entered(body):
	Checkpoints2.spawn = global_position
