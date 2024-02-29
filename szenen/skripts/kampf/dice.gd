class_name Dice extends Label

@export_range(0, 2) var value := 1
@export var magic := false
@export var held := false

var stop_rolling = 0

func _process(delta):
	if value > 0:
		text = str(value)
	else:
		text = ""
	$Magie.visible = magic
	$Held.visible = held


func _on_timer_timeout():
	roll()

func stop():
	$Timer.stop()
	roll()

func start():
	$Timer.start()

func krit():
	return value == 2
	
func status():
	return value == 0
	
func hit():
	return value == 1
	
func roll():
	value = clampi(randi_range(0, 5), 0, 2)
	if value == 1:
		value = 2
	elif value == 2:
		value = 1
	magic = randi_range(0, 5) >= 3
	held = randi_range(0, 5) >= 4
