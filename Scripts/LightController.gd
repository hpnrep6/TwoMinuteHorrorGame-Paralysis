extends Spatial


var light

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_children():
		if("ight" in node.name):
			light = node
			return

func turnOn():
	light.visible = true
	
func turnOff():
	light.visible = false
	
func switch():
	light.visible = not light.visible
