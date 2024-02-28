extends PanelContainer

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://szenen/kampf.tscn")


func _on_timer_timeout():
	$Vertrauter.atk = randi_range(1, 3)
	$Vertrauter.hp = randi_range(1, 3)
	$Vertrauter.speed = randi_range(1, 3)
	$Vertrauter.magic = randi_range(1, 3)
	$Vertrauter.def = randi_range(1, 3)
	
	#const min = 5
	#const max = 7
	
	#var a = randi_range(min, max)
	#var b = randi_range(min, max)
	#var c = randi_range(min, max)
	#var d = randi_range(min, max)
	#var e = randi_range(min, max)
	#var sum = a + b + c + d + e
	#if sum == max * 5 - 6:
	#	print(str(a, ", ", b, ", ", c, ", ", d, ", ", e, " SUM ", sum))


func _on_vertrauter_died():
	print("Vertrauter ist gestorben")


func _on_vertrauter_damaged(damage: int):
	print(str("Vertrauten wurden ", damage, " Schaden gemacht."))


func _on_vertrauter_healed(heal: int):
	print(str("Vertrauter wurde um ", heal, " geheilt."))
