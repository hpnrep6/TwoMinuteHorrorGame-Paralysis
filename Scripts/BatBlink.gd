extends MarginContainer

var bat1 = preload("res://Images/bat1.png")
var bat2 = preload("res://Images/bat2.png")
var counter = 0
var mode = false
var dead = false
var enabled = false
onready var texture = $TextureRect

# flashing battery 

func _process(delta):
	if not enabled:
		texture.visible = false
		return
	if dead:
		texture.set_texture(bat2)
		return
	counter += delta
	if counter > 1:
		if mode == true:
			texture.set_texture(bat1)
			mode = false
		else:
			texture.set_texture(bat2)
			mode = true
		counter = 0
		
func enable():
	enabled = true
	texture.visible = true
	
func disable():
	dead = true

func batDead():
	dead = true
	
