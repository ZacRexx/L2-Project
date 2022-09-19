extends Timer
#  when the game starts time is 0 and time is on
var time = 0
var timer_on = true

#funtionalty of the timer. WHen the timer is on the time will go up by seconds 
#than after a certain amount of time will go to minutes than to hours etc.
# The cnavas will be printed out in the top coner and 
#it will be the current time.
func _process(delta: float) -> void:
	if(timer_on):
		time += delta
		var mils=fmod (time,1)*1000
		var secs=fmod (time,60)
		var mins=fmod (time,60*60)/60
		var current_time="%02d:%02d:%03d"%[mins,secs,mils]
		$CanvasLayer/Label.text=current_time
	
	
	

# when player collsion enter this object collison the timer will stop.
func _on_finish_body_entered(body):
	if body.name == "player":
		timer_on = false

