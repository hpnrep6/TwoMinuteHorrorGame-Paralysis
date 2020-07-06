extends Spatial

var animation
var isOpen = false
var actionPerformed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_children():
		if node.name == "AnimationPlayer":
			animation = get_node("AnimationPlayer")
			return

func _process(delta):
	pass
	

func onTriggerA(body):
	if actionPerformed < 2 and not isOpen and body.name == "Player":
		animation.play("OpenDoor")
		isOpen = true
		actionPerformed = actionPerformed + 1
		var audiomanager = get_parent().get_parent().get_children()
		for node in audiomanager:
			if node.name == "Audio":
				node.playDoorOpen()
				return
		
		
func onTriggerB(body):
	if actionPerformed < 2 and isOpen == true and body.name == "Player":
		animation.play("CloseDoor")
		isOpen = false
		actionPerformed = actionPerformed + 1
		var audiomanager = get_parent().get_parent().get_children()
		for node in audiomanager:
			if node.name == "Audio":
				node.playDoorClose()
				return
