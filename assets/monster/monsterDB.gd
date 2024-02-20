class_name MonsterDB extends Node

# [LP, ATK, Speed, Magic, DEF, flip, Lore]
enum {AbyssalShadow, BreezyWooler, CelestialGuardian, CluckstertheMystic, CrystalWyrm, DeathWitch, Dragoblin, EternalFrostWarden, FlameheartBeast, ForestFidget, LuminousBloom, MeadowMischief, MoonlightHopper, NightsongSpecter, Phoenix, StormbringerWyrm, StormscaleLeviathan, Thunderhoof, TimeWeaver, VoidStalker, WhisperingShade, Widbear, Zephyrclaw}

const DATA: Dictionary = {
	 AbyssalShadow:
		 [2, 2, 2, 2, 2, false],
	 BreezyWooler:
		 [2, 2, 2, 2, 2, false],
	 CelestialGuardian:
		 [2, 2, 2, 2, 2, false],
	 CluckstertheMystic:
		 [2, 2, 2, 2, 2, false],
	 CrystalWyrm:
		 [2, 2, 2, 2, 2, false],
	 DeathWitch:
		 [2, 2, 2, 2, 2, false],
	 Dragoblin:
		 [2, 2, 2, 2, 2, true],
	 EternalFrostWarden:
		 [2, 2, 2, 2, 2, true],
	 FlameheartBeast:
		 [2, 2, 2, 2, 2, false],
	 ForestFidget:
		 [2, 2, 2, 2, 2, false],
	 LuminousBloom:
		 [2, 2, 2, 2, 2, false],
	 MeadowMischief:
		 [2, 2, 2, 2, 2, false],
	 MoonlightHopper:
		 [2, 2, 2, 2, 2, true],
	 NightsongSpecter:
		 [2, 2, 2, 2, 2, true],
	 Phoenix:
		 [2, 2, 2, 2, 2, true],
	 StormbringerWyrm:
		 [2, 2, 2, 2, 2, false],
	 StormscaleLeviathan:
		 [2, 2, 2, 2, 2, false],
	 Thunderhoof:
		 [2, 2, 2, 2, 2, false],
	 TimeWeaver:
		 [2, 2, 2, 2, 2, true],
	 VoidStalker:
		 [2, 2, 2, 2, 2, true],
	 WhisperingShade:
		 [2, 2, 2, 2, 2, true],
	 Widbear:
		 [2, 2, 2, 2, 2, true],
	 Zephyrclaw:
		 [2, 2, 2, 2, 2, false],
}

static func rand():
	return MonsterDB.DATA.keys().pick_random()