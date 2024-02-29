class_name Schadensberechnung extends RefCounted

const Angriff = preload("res://szenen/skripts/kampf/angriff.gd")

static func _calculiere_schaden(angreifer: Entitaet, verteidiger: Entitaet, moveNr: int, result: DiceRollResult) -> int:
	var angriff = angreifer.angriff[moveNr]
	
	var physicalDamage = angreifer.totalAtk() + result.hit
	var piercingDamage = result.krit * 2
	var magicDamage = 0
	
	var physicalDefense = verteidiger.totalDef()
	var piercingDefense = 0
	var magicDefense = 0
	
	if angriff.zusatz.has(Angriff.Zusatz.PiercingDamage):
		piercingDamage += physicalDamage
		physicalDamage = 0
	if angriff.zusatz.has(Angriff.Zusatz.MagicDamage):
		magicDamage += physicalDamage
		physicalDamage = 0
	if angriff.zusatz.has(Angriff.Zusatz.MagicBonusDamage):
		magicDamage += mini(angreifer.magic, result.magic)
	if angriff.zusatz.has(Angriff.Zusatz.MagicBonusMultiplikator):
		magicDamage += magicDamage * angreifer.magic
		
	var damage = maxi(physicalDamage - physicalDefense, 0) + maxi(magicDamage - magicDefense, 0) + maxi(piercingDamage - piercingDefense, 0)
	if !angriff.zusatz.has(Angriff.Zusatz.ArcaneElement):
		damage *= _calculiere_elemental_multiplayer(angriff, verteidiger)
	
	verteidiger.hp_value -= damage
	verteidiger.alive = verteidiger.hp_value > 0
	angreifer.alive = angreifer.hp_value > 0
	return damage

static func _calculiere_elemental_multiplayer(angriff: Angriff, verteidiger: Entitaet) -> float:
	match angriff.typ:
		Enums.Element.Fire:
			if verteidiger.typ == Enums.Element.Water:
				return 0.5
			if verteidiger.typ == Enums.Element.Wood || verteidiger.typ == Enums.Element.Metal:
				return 2
			if verteidiger.typ == Enums.Element.Earth:
				return -1
		Enums.Element.Earth:
			if verteidiger.typ == Enums.Element.Wood:
				return 0.5
			if verteidiger.typ == Enums.Element.Fire || verteidiger.typ == Enums.Element.Water:
				return 2
			if verteidiger.typ == Enums.Element.Metal:
				return -1
		Enums.Element.Metal:
			if verteidiger.typ == Enums.Element.Fire:
				return 0.5
			if verteidiger.typ == Enums.Element.Earth || verteidiger.typ == Enums.Element.Wood:
				return 2
			if verteidiger.typ == Enums.Element.Water:
				return -1
		Enums.Element.Water:
			if verteidiger.typ == Enums.Element.Earth:
				return 0.5
			if verteidiger.typ == Enums.Element.Metal || verteidiger.typ == Enums.Element.Fire:
				return 2
			if verteidiger.typ == Enums.Element.Wood:
				return -1
		Enums.Element.Wood:
			if verteidiger.typ == Enums.Element.Metal:
				return 0.5
			if verteidiger.typ == Enums.Element.Water || verteidiger.typ == Enums.Element.Earth:
				return 2
			if verteidiger.typ == Enums.Element.Fire:
				return -1
	return 1
	
