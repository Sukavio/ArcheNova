class_name Angriff extends Node

enum Zusatz {MagicBonusDamage, MagicBonusMultiplikator, PiercingDamage, MagicDamage, ArcaneElement}

var bezeichnung: String
var typ: Enums.Element
var dices: int
var beschreibung: String
var zusatz: Array[Zusatz]

func _init(_bezeichnung: String, _typ: Enums.Element, _dices: int, _beschreibung: String, zusaetze: Array[Zusatz]):
	bezeichnung = _bezeichnung
	typ = _typ
	dices = _dices
	beschreibung = _beschreibung
	zusatz = zusaetze
