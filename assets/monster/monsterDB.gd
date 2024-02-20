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
		 [2, 2, 2, 2, 2, false, Element.Earth],
	 BreezyWooler:
		 [2, 2, 2, 2, 2, false, Element.Wood],
	 CelestialGuardian:
		 [2, 2, 2, 2, 2, false, Element.Metal],
	 CluckstertheMystic:
		 [2, 2, 2, 2, 2, false, Element.Wood],
	 CrystalWyrm:
		 [2, 2, 2, 2, 2, false, Element.Metal],
	 DeathWitch:
		 [2, 2, 2, 2, 2, false, Element.Fire],
	 Dragoblin:
		 [2, 2, 2, 2, 2, true, Element.Fire],
	 EternalFrostWarden:
		 [2, 2, 2, 2, 2, true, Element.Water],
	 FlameheartBeast:
		 [2, 2, 2, 2, 2, false, Element.Fire],
	 ForestFidget:
		 [2, 2, 2, 2, 2, false, Element.Wood],
	 LuminousBloom:
		 [2, 2, 2, 2, 2, false, Element.Wood],
	 MeadowMischief:
		 [2, 2, 2, 2, 2, false, Element.Wood],
	 MoonlightHopper:
		 [2, 2, 2, 2, 2, true, Element.Water],
	 NightsongSpecter:
		 [2, 2, 2, 2, 2, true, Element.Earth],
	 Phoenix:
		 [2, 2, 2, 2, 2, true, Element.Fire],
	 StormbringerWyrm:
		 [2, 2, 2, 2, 2, false, Element.Water],
	 StormscaleLeviathan:
		 [2, 2, 2, 2, 2, false, Element.Water],
	 Thunderhoof:
		 [2, 2, 2, 2, 2, false, Element.Water],
	 TimeWeaver:
		 [2, 2, 2, 2, 2, true, Element.Water],
	 VoidStalker:
		 [2, 2, 2, 2, 2, true, Element.Earth],
	 WhisperingShade:
		 [2, 2, 2, 2, 2, true, Element.Fire],
	 Widbear:
		 [2, 2, 2, 2, 2, true, Element.Wood],
	 Zephyrclaw:
		 [2, 2, 2, 2, 2, false, Element.Metal],
}

static func rand():
	return MonsterDB.DATA.keys().pick_random()