class_name Gegner extends VBoxContainer

var monsterName = MonsterDB.rand()
# Name, Leben, ATK, Speed, Magic, DEF, Flip
var _monster: Array = ['Missingno', 1, 1, 1, 1, 1, false]

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
	random()

func _process(_delta):
	hp_value = clampi(hp_value, 0, hp() * hp_scale)
		
	if hp_value != previes_hp_value:
		if hp_value > previes_hp_value:
			healed.emit(hp_value-previes_hp_value)
		else:
			damaged.emit(previes_hp_value-hp_value)
		previes_hp_value = hp_value
	
	if hp_value <= 0 and ko == false:
		ko = true
		koed.emit()
	
	if hp() <= 0 and dead == false:
		dead = true
		died.emit()
	
	# Render
	%Avatar/VBoxContainer/Atk.value = atk()
	%Avatar/VBoxContainer/Speed.value = speed()
	%Avatar/VBoxContainer/Magie.value = magic()
	%Avatar/VBoxContainer/Def.value = def()
	%LP.max_value = hp() * hp_scale
	%LP.value = hp_value

func change_monster():
	_monster = MonsterDB.DATA.get(monsterName)
	hp_value = hp() * hp_scale
	previes_hp_value = hp_value
	$Avatar.texture = load(str("res://assets/monster/", _monster[0], ".png"))
	$Name.text = name()
	$Avatar.flip_h = _monster[6]
	
func random():
	_monster[1] = 4
	# _monster[2] = randi_range(1,5)
	# _monster[3] = randi_range(1,5)
	# _monster[4] = randi_range(1,5)
	# _monster[5] = randi_range(1,5)
	hp_value = hp() * hp_scale
	previes_hp_value = hp_value

func name():
	return _monster[0].capitalize()

func hp():
	return _monster[1]

func atk():
	return _monster[2]
	
func speed():
	return _monster[3]
	
func magic():
	return _monster[4]

func def():
	return _monster[5]
