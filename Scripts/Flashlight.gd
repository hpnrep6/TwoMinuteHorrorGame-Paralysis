extends Spatial

var batteryTime = 70
var enabled = false
onready var light = $Light
onready var body = $flashlight
onready var hud = $Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if not enabled:
		return
	if light.visible == true:
		batteryTime -= delta
	if batteryTime < 0:
		light.visible = false
		hud.disable()
		endGame()
		return
	if Input.is_action_just_pressed("mouseOne"):
		light.visible = not light.visible

func enableLight():
	enabled = true
	body.visible = true
	hud.enable()

func endGame():
	# ends the game when flashlight runs out
	var children = []
	children = get_parent().get_parent().get_children()
	for node in children:
		if(node.name == "gjamhouse"):
			node.forceEnd(get_parent())
			return
