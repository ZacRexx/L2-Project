extends CollisionShape2D
#onready var starting_spawn = $StartingSpawn

# when player enters the collsion of the spikes the player
# will go to the positon of the global psotion which is the checkpoint.
func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "player":
		if Checkpoints2.spawn:
			body.global_position = Checkpoints2.spawn
		







