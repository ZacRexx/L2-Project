extends Area2D




#When function player enters this collsion the new clobal psotion 
#for the player will be the checkpoint.
func _on_spawn2_body_entered(body):
	Checkpoints2.spawn = global_position
