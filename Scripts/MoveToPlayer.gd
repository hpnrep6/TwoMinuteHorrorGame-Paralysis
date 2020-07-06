extends KinematicBody

var active = false
var ending = false
var countdown = 3
var player
var velocity = Vector3.ZERO
var location
func _ready():
	pass # Replace with function body.

func _process(delta):
	if not active:
		return
	location = global_transform.origin
	velocity = location.direction_to(player.transform.origin)
	move_and_slide(velocity)
	if ending == true:
		if countdown > 0:
			countdown -= delta
		else:
			player.endGame()
			countdown = 100
			# only calls function once
		
	
func activate(body):
	if body.name == "Player":
		player = body
		active = true	

func _on_Area_body_entered(body):
	if(body.name == "Player"):
		ending = true
		
