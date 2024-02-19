class_name Vertrauter extends VBoxContainer

@export var atk := 5
@export var speed := 5
@export var magic := 5
@export var def := 5
@export var hp := 5

var hp_value := 1
var previes_hp_value := 1
var dead := false
var ko := false
const hp_scale := 10

signal koed
signal died
signal damaged
signal healed

func flip(): 
	$Avatar.flip_h = true

func _ready():
	hp_value = hp * hp_scale
	previes_hp_value = hp_value

func _process(delta):
	hp_value = clampi(hp_value, 0, hp * hp_scale)
		
	if hp_value != previes_hp_value:
		if hp_value > previes_hp_value:
			healed.emit(hp_value-previes_hp_value)
		else:
			damaged.emit(previes_hp_value-hp_value)
		previes_hp_value = hp_value
	
	if hp_value <= 0 and ko == false:
		ko = true
		koed.emit()
	
	if hp <= 0 and dead == false:
		dead = true
		died.emit()
	
	# Render
	%Avatar/VBoxContainer/Atk.value = atk
	%Avatar/VBoxContainer/Speed.value = speed
	%Avatar/VBoxContainer/Magie.value = magic
	%Avatar/VBoxContainer/Def.value = def
	%LP.max_value = hp * hp_scale
	%LP.value = hp_value
