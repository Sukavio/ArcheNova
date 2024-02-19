extends PanelContainer

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://szenen/kampf.tscn")


func _on_timer_timeout():
	$Vertrauter.atk = randi_range(1, 5)
	$Vertrauter.hp = randi_range(0, 5)
	$Vertrauter.speed = randi_range(1, 5)
	$Vertrauter.magic = randi_range(1, 5)
	$Vertrauter.def = randi_range(1, 5)


func _on_vertrauter_died():
	print("Vertrauter ist gestorben")


func _on_vertrauter_damaged(damage: int):
	print(str("Vertrauten wurden ", damage, " Schaden gemacht."))


func _on_vertrauter_healed(heal: int):
	print(str("Vertrauter wurde um ", heal, " geheilt."))
