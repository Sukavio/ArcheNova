class_name AttackeDB extends Node

const Angriff = preload("res://szenen/skripts/kampf/angriff.gd")

enum {Wollen, Pick, CrystalBite, FireBreath, Magic, Blast, JumpKick, Ram}

static var DATA = {
	Wollen:
		Angriff.new('Wollen', Enums.Element.Wood, 5, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	Pick:
		Angriff.new('Pick', Enums.Element.Wood, 3, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	CrystalBite:
		Angriff.new('CrystalBite', Enums.Element.Metal, 3, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	FireBreath:
		Angriff.new('FireBreath', Enums.Element.Fire, 6, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	Magic:
		Angriff.new('Magic', Enums.Element.Wood, 1, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	Blast:
		Angriff.new('Blast', Enums.Element.Wood, 8, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	JumpKick:
		Angriff.new('JumpKick', Enums.Element.Water, 4, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
	Ram:
		Angriff.new('Ram', Enums.Element.Wood, 2, 'Wollt den Gegner ein', [Angriff.Zusatz.MagicBonusDamage]),
}
