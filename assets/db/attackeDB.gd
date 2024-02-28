class_name AttackeDB extends Node

const Angriff = preload("res://szenen/skripts/angriff.gd")

enum {Wollen, Pick, CrystalBite, FireBreath, Magic, Blast, JumpKick, Ram}

static var DATA = {
	Wollen:
		Angriff.new('Wollen', Enums.Element.Wood, 5, 'Wollt den Gegner ein'),
	Pick:
		Angriff.new('Pick', Enums.Element.Wood, 3, 'Wollt den Gegner ein'),
	CrystalBite:
		Angriff.new('CrystalBite', Enums.Element.Metal, 3, 'Wollt den Gegner ein'),
	FireBreath:
		Angriff.new('FireBreath', Enums.Element.Fire, 6, 'Wollt den Gegner ein'),
	Magic:
		Angriff.new('Magic', Enums.Element.Wood, 1, 'Wollt den Gegner ein'),
	Blast:
		Angriff.new('Blast', Enums.Element.Wood, 8, 'Wollt den Gegner ein'),
	JumpKick:
		Angriff.new('JumpKick', Enums.Element.Water, 4, 'Wollt den Gegner ein'),
	Ram:
		Angriff.new('Ram', Enums.Element.Wood, 2, 'Wollt den Gegner ein'),
}
