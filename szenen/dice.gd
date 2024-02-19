class_name Dice extends Label

@export_range(0, 2) var value := 1
@export var magic := false
@export var ausdauer := false

var stop_rolling = false

signal result_ready

func _process(delta):
	if value > 0:
		text = str(value)
	else:
		text = ""
	$Magie.visible = magic
	$Ausdauer.visible = ausdauer


func _on_timer_timeout():
	value = clampi(randi_range(0, 5), 0, 2)
	if value == 1:
		value = 2
	elif value == 2:
		value = 1
	magic = randi_range(0, 5) >= 3
	ausdauer = randi_range(0, 5) >= 4
	if stop_rolling:
		$Timer.stop()
		result_ready.emit(self)

func stop():
	stop_rolling = true

func krit():
	return value == 2
	
func status():
	return value == 0
	
func hit():
	return value > 0
