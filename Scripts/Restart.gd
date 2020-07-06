extends Spatial

func _process(delta):
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
	elif Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/StartMenu.tscn")
