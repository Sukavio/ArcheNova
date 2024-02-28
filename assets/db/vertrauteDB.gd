class_name VertrauteDB extends Node

const AttackeDB = preload("res://assets/db/attackeDB.gd")

enum {Thalion, Ragnar, Liliana, Fenris, Seraphina, Grimbeard, Zephyr, Kira, Lunara}

# [0,    1,  2,   3,     4,     5,   6,    8,       9,     10     ]
# [Name, LP, ATK, Speed, Magic, DEF, flip, Element, Stufe, Angriff]
# 5 Elements
# 8 Fire - Fire, Monster, Shadow
# 9 Water - Time, Water, Ice, Moon, Thunder?, Air?
# 6 Earth - Earth, Dark, Underground, Undead
# 6 Metal - Metal, Light, Good, Thunder?, Air?
# 9 Wood - Plants, Wood, Animals, Fairy
const DATA: Dictionary = {
	Thalion:
		['Thalion', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Ragnar:
		['Ragnar', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Liliana:
		['Liliana', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Fenris:
		['Fenris', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Seraphina:
		['Seraphina', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Grimbeard:
		['Grimbeard', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Zephyr:
		['Zephyr', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Kira:
		['Kira', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
	Lunara:
		['Lunara', 1, 1, 1, 1, 1, false, Enums.Element.Earth, 1, AttackeDB.CrystalBite],
}

static func rand():
	return VertrauteDB.DATA.values().pick_random()
