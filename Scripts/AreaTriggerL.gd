extends Area

func _on_Area_body_entered(body):
	if body.has_method("getLight"):
		body.getLight()
		get_parent().get_parent().visible = false
