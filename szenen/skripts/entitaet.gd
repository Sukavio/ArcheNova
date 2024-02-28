class_name Entitaet extends VBoxContainer

const Angriff = preload("res://szenen/skripts/angriff.gd")

const hp_scale = 10
const iv_positiv = 2
const iv_negativ = -1
const element_bonus = 1

@export() var bezeichnung = 'MissingNo'
@export() var stufe = 1

@export() var hp = 1
@export() var atk = 1
@export() var speed = 1
@export() var magic = 1
@export() var def = 1

@export() var typ := Enums.Element.Fire

@export_enum("hp", "atk", "speed", "magic", "def") var ivPro: String = 'speed'
@export_enum("hp", "atk", "speed", "magic", "def") var ivNeg: String = 'speed'

@export() var angriff: Angriff

var hp_value
	
func get_iv_bonus(wert: String):
	return (iv_positiv if ivPro == wert else 0) + (iv_negativ if ivNeg == wert else 0)
	
func get_element_bonus(element: Enums.Element) -> int:
	return (element_bonus * stufe) if typ == element else 0
	
func _ready():
	reload()

func reload():
	hp_value = totalHP() * hp_scale
	$Name.text = bezeichnung
	
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
				($Avatar/VBoxContainer/Atk as Label).add_theme_color_override("font_color", Color.DARK_BLUE)
			"speed":
				($Avatar/VBoxContainer/Speed as Label).add_theme_color_override("font_color", Color.DARK_BLUE)
			"def":
				($Avatar/VBoxContainer/Def as Label).add_theme_color_override("font_color", Color.DARK_BLUE)
			"magic":
				($Avatar/VBoxContainer/Magie as Label).add_theme_color_override("font_color", Color.DARK_BLUE)
			"hp":
				($LP/Label as Label).label_settings.font_color = Color.DARK_BLUE

func _process(_delta):	
	hp_value = clampi(hp_value, 0, totalHP() * hp_scale)
	
	# Render
	%Avatar/VBoxContainer/Atk.value = totalAtk()
	%Avatar/VBoxContainer/Speed.value = totalSpeed()
	%Avatar/VBoxContainer/Magie.value = totalMagic()
	%Avatar/VBoxContainer/Def.value = totalDef()
	%LP.max_value = totalHP() * hp_scale
	%LP.value = hp_value
	
func totalHP():
	return maxi(hp + get_iv_bonus("hp") + get_element_bonus(Enums.Element.Wood), 2)
	
func totalAtk():
	return maxi(atk + get_iv_bonus("atk") + get_element_bonus(Enums.Element.Fire), 0)
	
func totalDef():
	return maxi(def + get_iv_bonus("def") + get_element_bonus(Enums.Element.Earth), 0)
	
func totalSpeed():
	return maxi(speed + get_iv_bonus("speed") + get_element_bonus(Enums.Element.Metal), 0)
	
func totalMagic():
	return maxi(magic + get_iv_bonus("magic") + get_element_bonus(Enums.Element.Water), 0)
