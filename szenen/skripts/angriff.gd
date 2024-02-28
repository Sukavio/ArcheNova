class_name Angriff extends Node

var bezeichnung: String
var typ: Enums.Element
var dices: int
var beschreibung: String

func _init(_bezeichnung: String, _typ: Enums.Element, _dices: int, _beschreibung: String):
	bezeichnung = _bezeichnung
	typ = _typ
	dices = _dices
	beschreibung = _beschreibung
