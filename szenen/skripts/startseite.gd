extends PanelContainer

func _process(delta):
	if Input.is_action_just_pressed("an_ende"):
		_on_beenden_pressed()

func _on_beenden_pressed():
	get_tree().quit(0)

func _on_start_pressed():
	GameManager.new_game()
	get_tree().change_scene_to_file("res://szenen/reise.tscn")
