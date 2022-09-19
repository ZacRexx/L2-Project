extends Node2D


# When the action reset button is pressed the folling 
#fuction will happen resent current scene and set the 
#players spawn back to null
#git error 
func _process(_delta):
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
		Checkpoints2.spawn = Vector2(0,0)



