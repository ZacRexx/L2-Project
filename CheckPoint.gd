extends Area2D


#var active: bool = false

#onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")








#func _on_CheckPoint_body_entered(body) -> void:
	#if body.name == "player":
		#if not active:
			#if body.last_checkpoint != null:
				#body.last_checkpoint.desactivate()
			#body.last_checkpoint = self
			#animated_sprite.play("default")
			#active = true


#func desactivate() -> void:
	#animated_sprite.play("default")
	#active = false
