class_name MonsterDB extends Node

# [LP, ATK, Speed, Magic, DEF, flip, Lore, Element]
enum {AbyssalShadow, BreezyWooler, CelestialGuardian, CluckstertheMystic, CrystalWyrm, DeathWitch, Dragoblin, EternalFrostWarden, FlameheartBeast, ForestFidget, LuminousBloom, MeadowMischief, MoonlightHopper, NightsongSpecter, Phoenix, StormbringerWyrm, StormscaleLeviathan, Thunderhoof, TimeWeaver, VoidStalker, WhisperingShade, Widbear, Zephyrclaw}

# 5 Elements
# 8 Fire - Fire, Monster, Shadow
# 9 Water - Time, Water, Ice, Moon, Thunder?, Air?
# 6 Earth - Earth, Dark, Underground, Undead
# 6 Metal - Metal, Light, Good, Thunder?, Air?
# 9 Wood - Plants, Wood, Animals, Fairy
enum Element {Fire, Water, Earth, Metal, Wood}

const DATA: Dictionary = {
	 AbyssalShadow:
		 ['AbyssalShadow', 2, 2, 2, 2, 2, false, Element.Earth],
	 BreezyWooler:
		 ['BreezyWooler', 2, 2, 2, 2, 2, false, Element.Wood],
	 CelestialGuardian:
		 ['CelestialGuardian', 2, 2, 2, 2, 2, false, Element.Metal],
	 CluckstertheMystic:
		 ['CluckstertheMystic', 2, 2, 2, 2, 2, false, Element.Wood],
	 CrystalWyrm:
		 ['CrystalWyrm', 2, 2, 2, 2, 2, false, Element.Metal],
	 DeathWitch:
		 ['DeathWitch', 2, 2, 2, 2, 2, false, Element.Fire],
	 Dragoblin:
		 ['Dragoblin', 2, 2, 2, 2, 2, true, Element.Fire],
	 EternalFrostWarden:
		 ['EternalFrostWarden', 2, 2, 2, 2, 2, true, Element.Water],
	 FlameheartBeast:
		 ['FlameheartBeast', 2, 2, 2, 2, 2, false, Element.Fire],
	 ForestFidget:
		 ['ForestFidget', 2, 2, 2, 2, 2, false, Element.Wood],
	 LuminousBloom:
		 ['LuminousBloom', 2, 2, 2, 2, 2, false, Element.Wood],
	 MeadowMischief:
		 ['MeadowMischief', 2, 2, 2, 2, 2, false, Element.Wood],
	 MoonlightHopper:
		 ['MoonlightHopper', 2, 2, 2, 2, 2, true, Element.Water],
	 NightsongSpecter:
		 ['NightsongSpecter', 2, 2, 2, 2, 2, true, Element.Earth],
	 Phoenix:
		 ['Phoenix', 2, 2, 2, 2, 2, true, Element.Fire],
	 StormbringerWyrm:
		 ['StormbringerWyrm', 2, 2, 2, 2, 2, false, Element.Water],
	 StormscaleLeviathan:
		 ['StormscaleLeviathan', 2, 2, 2, 2, 2, false, Element.Water],
	 Thunderhoof:
		 ['Thunderhoof', 2, 2, 2, 2, 2, false, Element.Water],
	 TimeWeaver:
		 ['TimeWeaver', 2, 2, 2, 2, 2, true, Element.Water],
	 VoidStalker:
		 ['VoidStalker', 2, 2, 2, 2, 2, true, Element.Earth],
	 WhisperingShade:
		 ['WhisperingShade', 2, 2, 2, 2, 2, true, Element.Fire],
	 Widbear:
		 ['Widbear', 2, 2, 2, 2, 2, true, Element.Wood],
	 Zephyrclaw:
		 ['Zephyrclaw', 2, 2, 2, 2, 2, false, Element.Metal],
}

static func rand():
	print(MonsterDB.DATA.keys())
	return MonsterDB.DATA.keys().pick_random()
