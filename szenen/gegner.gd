class_name Gegner extends VBoxContainer

var monsterName = MonsterDB.rand()
var monster = MonsterDB.DATA.get(monsterName)

var hp_value := 1
var previes_hp_value := 1
var dead := false
var ko := false
const hp_scale := 10

signal koed
signal died
signal damaged
signal healed

func _ready():
	change_monster();

func _process(delta):
	hp_value = clampi(hp_value, 0, monster[1] * hp_scale)
		
	if hp_value != previes_hp_value:
		if hp_value > previes_hp_value:
			healed.emit(hp_value-previes_hp_value)
		else:
			damaged.emit(previes_hp_value-hp_value)
		previes_hp_value = hp_value
	
	if hp_value <= 0 and ko == false:
		ko = true
		koed.emit()
	
	if monster[1] <= 0 and dead == false:
		dead = true
		died.emit()
	
	# Render
	%Avatar/VBoxContainer/Atk.value = monster[2]
	%Avatar/VBoxContainer/Speed.value = monster[3]
	%Avatar/VBoxContainer/Magie.value = monster[4]
	%Avatar/VBoxContainer/Def.value = monster[5]
	%LP.max_value = monster[1] * hp_scale
	%LP.value = hp_value

func change_monster():
	monster = MonsterDB.DATA.get(monsterName)
	hp_value = monster[1] * hp_scale
	previes_hp_value = hp_value
	$Avatar.texture = load(str("res://assets/monster/", monster[6]))
	$Name.text = monster[0]
	$Avatar.flip_h = monster[7]
	


func _on_timer_timeout():
	monsterName = MonsterDB.rand()
	change_monster()
