extends MeshInstance

var timePassed = 0

# Called when the node enters the scene tree for the first time.
#func _ready():



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timePassed += delta
	if timePassed > 0.05:
		rotate_y(randf()*15)
		rotate_x(deg2rad((randi() % 2) * 180))
		timePassed = 0
	
