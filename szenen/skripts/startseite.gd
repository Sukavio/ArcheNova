extends PanelContainer

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_start_pressed()
	if Input.is_action_just_pressed("ui_end") || Input.is_action_just_pressed("ui_cancel"):
		_on_beenden_pressed()

func _on_beenden_pressed():
	get_tree().quit(0)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://szenen/kampf.tscn")
