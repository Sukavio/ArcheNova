class_name MonsterDB extends Node

# [Name, LP, ATK, Speed, Magic, DEF, Image, flip, Lore]
enum {Dragoblin, Widbear, Zephyrclaw, Phoenix, FlameheartBeast, AbyssalShadow, StormbringerWyrm, NightsongSpecter, EternalFrostWarden}

const DATA = {
	Dragoblin: 
		["Dragoblin", 2, 2, 3, 1, 3, "dragoblin.png", true],
	Widbear: 
		["Widbear", 3, 4, 4, 1, 2, "widbear.png", true],
	Zephyrclaw: 
		["Zephyrclaw", 5, 3, 4, 3, 4, "zephyrclaw.png", false, "Es ist eine eindrucksvolle Mischung aus einem eisigen Drachen und einem schattenhaften Panther, umgeben von wirbelndem Schnee und Nebel."],
	Phoenix: 
		["Phoenix", 3, 1, 3, 3, 2, "phoenix.png", true],
	FlameheartBeast: 
		["Flameheart Beast", 5, 1, 3, 3, 2, "FlameheartBeast.png", false, "Es ist eine beeindruckende Kombination aus einem Löwen und einem Phönix, umgeben von vulkanischen Kräften, ein Symbol für die unkontrollierbare Natur des Feuers."],
	AbyssalShadow: 
		["Abyssal Shadow", 3, 1, 3, 3, 2, "AbyssalShadow.png", false, "Es ist eine mysteriöse Kreatur, die die Eleganz eines Panthers mit den geheimnisvollen Aspekten eines Tiefsee-Wesens kombiniert, umgeben von nebelverhangenen Abgründen."],
	StormbringerWyrm: 
		["Stormbringer Wyrm", 4, 1, 3, 3, 2, "StormbringerWyrm.png", false, "Es ist ein majestätisches Wesen, das die Kräfte von Sturm und Blitz kontrolliert, thront auf einer hohen Klippe, umgeben von wirbelnden Wolken und dem Brausen des Windes."],
	NightsongSpecter: 
		["Nightsong Specter", 2, 1, 3, 3, 2, "NightsongSpecter.png", true, "Es ist ein Wesen, das aus den Schatten selbst geboren wurde, ein Meister der Illusion und der Furcht, umhüllt von einem nebelartigen Dunst und der Dunkelheit der Nacht."],
	EternalFrostWarden: 
		["Eternal Frost Warden", 5, 4, 4, 1, 2, "EternalFrostWarden.png", false],
}

static func rand():
	return MonsterDB.DATA.keys().pick_random()
