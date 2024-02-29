extends HBoxContainer

var dices = preload("res://szenen/dice.tscn")

var _pause_scene = false

signal results_ready(moveNr: int, result: DiceRollResult)

func _on_atk_1_mouse_entered():
	if %Atk1.disabled == false:
		change_dices((%Kampf.spieler as Entitaet).angriff[0].dices)

func _on_atk_2_mouse_entered():
	if %Atk2.disabled == false:
		change_dices((%Kampf.spieler as Entitaet).angriff[1].dices)

func _on_atk_3_mouse_entered():
	if %Atk3.disabled == false:
		change_dices((%Kampf.spieler as Entitaet).angriff[2].dices)

func _on_atk_1_pressed():
	auswerten(0)

func _on_atk_2_pressed():
	auswerten(1)

func _on_atk_3_pressed():
	auswerten(2)

func change_dices(count: int, force: bool = false):
	if !_pause_scene || force:
		get_parent().custom_minimum_size = Vector2(count * 100, 100)
		var dice_counts = %DiceTray.get_child_count()
		if dice_counts != count:
			if dice_counts > count:
				for x in range(0, dice_counts - count):
					var d = %DiceTray.get_child(0)
					%DiceTray.remove_child(d)
					d.queue_free()
			else:
				for x in range(0, count - dice_counts):
					%DiceTray.add_child(dices.instantiate())
					
func auswerten(moveNr: int):
	_pause_scene = true
	var result = DiceRollResult.new()
	for dice in %DiceTray.get_children():
		dice.stop()
		if dice.hit():
			result.hit += 1
		if dice.krit():
			result.krit += 1
		if dice.status():
			result.status += 1
		if dice.magic:
			result.magic += 1
		if dice.held:
			result.held += 1
	results_ready.emit(moveNr, result)
		
func next(dices: int):
	change_dices(dices, true)
	for x in %DiceTray.get_children():
		x.roll()
	auswerten(0)
		
func unpause():
	_pause_scene = false
	for x in %DiceTray.get_children():
		x.start()
