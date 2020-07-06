extends Spatial

var ceilinglights = []
var shortlights = []
var talllights = []
var countDown = 25
var startEnd = false
var playerBody

onready var follower = $FollowPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()
	for node in children:
		if "ceilinglight" in node.name:
			if node.has_method("turnOff"):
				ceilinglights.push_back(node)
		elif "shortlight" in node.name:
			if node.has_method("turnOff"):
				shortlights.push_back(node)
		elif "talllight" in node.name:
			if node.has_method("turnOff"):
				talllights.push_back(node)

func _process(delta):
	if not startEnd:
		return
	if countDown > 0:
		countDown -= delta
		return
	else:
		follower.activate(playerBody)
		playerBody.freeze()

func onTriggerA(body):
	if(body.name == "Player"):
		# turns off all lights
		for node in ceilinglights:
			node.turnOff()
		for node in shortlights:
			node.turnOff()
		for node in talllights:
			node.turnOff()
		playerBody = body
		if startEnd == false:
			var audiomanager = get_parent().get_children()
			for node in audiomanager:
				if node.name == "Audio":
					node.playEnd()
		startEnd = true

func forceEnd(player):
	playerBody = player
	if startEnd == false:
		var audiomanager = get_parent().get_children()
		for node in audiomanager:
			if node.name == "Audio":
				node.playEnd()
	startEnd = true

func onTriggerB(body):
	if(body.name == "Player"):
		for node in shortlights:
			node.turnOff()
			
