extends Area

onready var paper = $toiletpaper
onready var light = $OmniLight
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area_body_entered(body):
	if body.name == "Player":
		paper.visible = false
		light.visible = false
