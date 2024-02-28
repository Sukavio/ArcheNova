class_name MonsterDB extends Node

const Angriff = preload("res://szenen/skripts/angriff.gd")

# [0,  1,   2,     3,     4,   5,    6,    7,       8,     9
# [LP, ATK, Speed, Magic, DEF, flip, Lore, Element, Stufe, Angriff]
enum {AbyssalShadow, BreezyWooler, CelestialGuardian, CluckstertheMystic, CrystalWyrm, DeathWitch, Dragoblin, EternalFrostWarden, FlameheartBeast, ForestFidget, LuminousBloom, MeadowMischief, MoonlightHopper, NightsongSpecter, Phoenix, StormbringerWyrm, StormscaleLeviathan, Thunderhoof, TimeWeaver, VoidStalker, WhisperingShade, Widbear, Zephyrclaw}
enum Attacks {Wollen, Pick, CrystalBite, FireBreath, Magic, Blast, JumpKick, Ram}

# 5 Elements
# 8 Fire - Fire, Monster, Shadow
# 9 Water - Time, Water, Ice, Moon, Thunder?, Air?
# 6 Earth - Earth, Dark, Underground, Undead
# 6 Metal - Metal, Light, Good, Thunder?, Air?
# 9 Wood - Plants, Wood, Animals, Fairy

const DATA: Dictionary = {
	 BreezyWooler:
		 ['BreezyWooler', 2, 3, 1, 2, 1, false, Enums.Element.Wood, 1, Attacks.Wollen],
	 CluckstertheMystic:
		 ['CluckstertheMystic', 2, 1, 2, 3, 1, false, Enums.Element.Wood, 1, Attacks.Pick],
	 CrystalWyrm:
		 ['CrystalWyrm', 1, 3, 3, 1, 1, false, Enums.Element.Metal, 1, Attacks.CrystalBite],
	 Dragoblin:
		 ['Dragoblin', 2, 2, 1, 2, 2, true, Enums.Element.Fire, 1, Attacks.FireBreath],
	 ForestFidget:
		 ['ForestFidget', 2, 1, 2, 1, 3, false, Enums.Element.Wood, 1, Attacks.Magic],
	 MeadowMischief:
		 ['MeadowMischief', 2, 2, 3, 1, 1, false, Enums.Element.Wood, 1, Attacks.Blast],
	 MoonlightHopper:
		 ['MoonlightHopper', 2, 3, 1, 1, 2, true, Enums.Element.Water, 1, Attacks.JumpKick],
	 Widbear:
		 ['Widbear', 2, 2, 3, 1, 1, true, Enums.Element.Wood, 1, Attacks.Ram],
	 AbyssalShadow:
		 ['AbyssalShadow', 5, 3, 3, 4, 4, false, Enums.Element.Earth, 2],
	 EternalFrostWarden:
		 ['EternalFrostWarden', 4, 4, 4, 3, 4, true, Enums.Element.Water, 2],
	 FlameheartBeast:
		 ['FlameheartBeast', 3, 3, 4, 5, 4, false, Enums.Element.Fire, 2],
	 LuminousBloom:
		 ['LuminousBloom', 4, 4, 4, 4, 4, false, Enums.Element.Wood, 2],
	 NightsongSpecter:
		 ['NightsongSpecter', 3, 5, 5, 3, 3, true, Enums.Element.Earth, 2],
	 Phoenix:
		 ['Phoenix', 3, 4, 4, 4, 4, true, Enums.Element.Fire, 2],
	 WhisperingShade:
		 ['WhisperingShade', 5, 3, 3, 5, 3, true, Enums.Element.Fire, 2],
	 CelestialGuardian:
		 ['CelestialGuardian', 5, 5, 7, 5, 7, false, Enums.Element.Metal, 3],
	 DeathWitch:
		 ['DeathWitch', 6, 5, 6, 5, 7, false, Enums.Element.Fire, 3],
	 StormbringerWyrm:
		 ['StormbringerWyrm', 6, 5, 6, 6, 6, false, Enums.Element.Water, 3],
	 StormscaleLeviathan:
		 ['StormscaleLeviathan', 7, 6, 5, 5, 6, false, Enums.Element.Water, 3],
	 Thunderhoof:
		 ['Thunderhoof', 6, 6, 6, 6, 5, false, Enums.Element.Water, 3],
	 TimeWeaver:
		 ['TimeWeaver', 5, 6, 7, 6, 5, true, Enums.Element.Water, 3],
	 VoidStalker:
		 ['VoidStalker', 6, 5, 7, 5, 6, true, Enums.Element.Earth, 3],
	 Zephyrclaw:
		 ['Zephyrclaw', 5, 5, 7, 5, 7, false, Enums.Element.Metal, 3],
}

static var ATTACK = {
	Attacks.Wollen:
		Angriff.new('Wollen', Enums.Element.Wood, 5, 'Wollt den Gegner ein'),
	Attacks.Pick:
		Angriff.new('Pick', Enums.Element.Wood, 3, 'Wollt den Gegner ein'),
	Attacks.CrystalBite:
		Angriff.new('CrystalBite', Enums.Element.Metal, 2, 'Wollt den Gegner ein'),
	Attacks.FireBreath:
		Angriff.new('FireBreath', Enums.Element.Fire, 6, 'Wollt den Gegner ein'),
	Attacks.Magic:
		Angriff.new('Magic', Enums.Element.Wood, 1, 'Wollt den Gegner ein'),
	Attacks.Blast:
		Angriff.new('Blast', Enums.Element.Wood, 8, 'Wollt den Gegner ein'),
	Attacks.JumpKick:
		Angriff.new('JumpKick', Enums.Element.Water, 4, 'Wollt den Gegner ein'),
	Attacks.Ram:
		Angriff.new('Ram', Enums.Element.Wood, 2, 'Wollt den Gegner ein'),
}

static func rand(stufe: int):
	return MonsterDB.DATA.values().filter(func(value): return value[8] == stufe).pick_random()
