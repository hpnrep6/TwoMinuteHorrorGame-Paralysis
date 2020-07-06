extends Area

func _on_Area_body_entered(body):
	if get_parent().get_parent().has_method("onTriggerA"):
		get_parent().get_parent().onTriggerA(body)
