extends HBoxContainer


var dices = preload("res://szenen/dice.tscn")

var _pause_scene = false

var hit = 0
var krit = 0
var status = 0
var magic = 0
var ausdauer = 0

var dice_count = 0

signal results_ready

	
func _on_atk_1_mouse_entered():
	change_dices(5)


func _on_atk_2_mouse_entered():
	change_dices(3)


func _on_atk_3_mouse_entered():
	change_dices(1)

func _on_atk_1_pressed():
	auswerten()

func _on_atk_2_pressed():
	auswerten()

func _on_atk_3_pressed():
	auswerten()

func change_dices(count: int):
	if !_pause_scene:
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
					
func auswerten():
	_pause_scene = true
	hit = 0
	krit = 0
	status = 0
	magic = 0
	ausdauer = 0
	dice_count = %DiceTray.get_child_count()
	for x in %DiceTray.get_children():
		x.connect("result_ready", _on_result_ready)
		x.stop()
	
func _on_result_ready(dice: Dice):
	if dice.hit():
		hit += 1
	if dice.krit():
		krit += 1
	if dice.status():
		status += 1
	if dice.magic:
		magic += 1
	if dice.ausdauer:
		ausdauer += 1
	dice.disconnect("result_ready", _on_result_ready)
	dice_count -= 1
	if (dice_count == 0):
		results_ready.emit()
