class_name Gegner extends VBoxContainer

var hp_value := 1
var previes_hp_value := 1
var dead := false
var ko := false
const hp_scale := 10

@export() var monster: String = 'MissingNo'
@export() var hp = 1
@export() var atk = 1
@export() var speed = 1
@export() var magic = 1
@export() var def = 1

@export() var alpha = false
@export() var legendary = false
@export() var shiny = false
@export() var raid = false

@export_enum("hp", "atk", "speed", "magic", "def") var ivPro: String = 'speed'
@export_enum("hp", "atk", "speed", "magic", "def") var ivNeg: String = 'speed'

signal damaged
signal healed

func _ready():
	change_monster(MonsterDB.rand());

func _process(_delta):	
	hp_value = clampi(hp_value, 0, totalHP() * hp_scale)
		
	if hp_value != previes_hp_value:
		if hp_value > previes_hp_value:
			healed.emit(hp_value-previes_hp_value)
		else:
			damaged.emit(previes_hp_value-hp_value)
		previes_hp_value = hp_value
	
	# Render
	%Avatar/VBoxContainer/Atk.value = totalAtk()
	%Avatar/VBoxContainer/Speed.value = totalSpeed()
	%Avatar/VBoxContainer/Magie.value = totalMagic()
	%Avatar/VBoxContainer/Def.value = totalDef()
	%LP.max_value = totalHP() * hp_scale
	%LP.value = hp_value

func change_monster(monsterName: int):
	var monsterDaten = MonsterDB.DATA.get(monsterName)
	monster = monsterDaten[0].capitalize()
	hp = monsterDaten[1]
	atk = monsterDaten[2]
	speed = monsterDaten[3]
	magic = monsterDaten[4]
	def = monsterDaten[5]
	random()
	ivPro = rand_IV()
	ivNeg = rand_IV()
	if raid:
		($Avatar as TextureRect).custom_minimum_size = Vector2(0, 600)
		monster = str("Raidboss ", monster)
	else:
		($Avatar as TextureRect).custom_minimum_size = Vector2(0, 500)
	if alpha:
		$Avatar/Alpha.visible = true
	else:
		$Avatar/Alpha.visible = false
	if legendary:
		monster = str("Legendäres ", monster)
	hp_value = totalHP() * hp_scale
	previes_hp_value = hp_value
	$Avatar.texture = load(str("res://assets/monster/", monsterDaten[0], ".png"))
	$Name.text = monster
	$Avatar.flip_h = monsterDaten[6]
	if ivPro != ivNeg:
		match ivPro:
			"atk":
				($Avatar/VBoxContainer/Atk as Label).add_theme_color_override("font_color", Color.YELLOW)
			"speed":
				($Avatar/VBoxContainer/Speed as Label).add_theme_color_override("font_color", Color.YELLOW)
			"def":
				($Avatar/VBoxContainer/Def as Label).add_theme_color_override("font_color", Color.YELLOW)
			"magic":
				($Avatar/VBoxContainer/Magie as Label).add_theme_color_override("font_color", Color.YELLOW)
			"hp":
				($LP/Label as Label).label_settings.font_color = Color.YELLOW
		match ivNeg:
			"atk":
				($Avatar/VBoxContainer/Atk as Label).add_theme_color_override("font_color", Color.LIGHT_GRAY)
			"speed":
				($Avatar/VBoxContainer/Speed as Label).add_theme_color_override("font_color", Color.LIGHT_GRAY)
			"def":
				($Avatar/VBoxContainer/Def as Label).add_theme_color_override("font_color", Color.LIGHT_GRAY)
			"magic":
				($Avatar/VBoxContainer/Magie as Label).add_theme_color_override("font_color", Color.LIGHT_GRAY)
			"hp":
				($LP/Label as Label).label_settings.font_color = Color.LIGHT_GRAY
			
	
func random():
	hp = randi_range(1,5)
	atk = randi_range(1,5)
	speed = randi_range(1,5)
	magic = randi_range(1,5)
	def = randi_range(1,5)
	legendary = randi_range(1, 10) > 9
	alpha = randi_range(1, 10) > 5
	raid = randi_range(1, 10) > 9
	
func rand_IV():
	return ["hp", "atk", "speed", "magic", "def"].pick_random()
	
func get_iv_bonus(wert: String):
	return (2 if ivPro == wert else 0) + (-1 if ivNeg == wert else 0)
	
func legendary_bonus():
	return 2 if legendary else 0
	
func totalHP():
	return maxi(hp + (2 if alpha else 0) + legendary_bonus() + get_iv_bonus("hp") + (5 if raid else 0), 2)
	
func totalAtk():
	return maxi(atk + (1 if alpha else 0) + legendary_bonus() + get_iv_bonus("atk"), 0)
	
func totalDef():
	return maxi(def + legendary_bonus() + get_iv_bonus("def"), 0)
	
func totalSpeed():
	return maxi(speed + legendary_bonus() + get_iv_bonus("speed"), 0)
	
func totalMagic():
	return maxi(magic + legendary_bonus() + get_iv_bonus("magic"), 0)
