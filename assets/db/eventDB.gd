class_name EventDB extends Node

enum eventKey {kampf, szene1, szene2, szene3, szene4}

const inselNamen = ['Nebelschleier-Insel', 'Drachenzahn-Klippen', 'Sternenfeuer-Archipel', 'Flüstern der Titanen', 'Azurblauen Träume', 'Smaragdflüster-Küste', 'Schattenlicht-Eiland', 'Dämmergold-Horizont', 'Frostflügel-Haven', 'Sonnenstein-Lagune', 'Zephyrwind-Inseln', 'Gezeitenzauber-Riff', 'Nachtecho-Insel', 'Feuerherz-Atoll', 'Seelensang-Klippen', 'Mondglanz-Spitze', 'Eisenwind-Dünen', 'Perlmutt-Schelf', 'Kristallflut-Bucht', 'Dunkelwisper-Wald', 'Himmelszorn-Gipfel', 'Bernsteinsonnen-Insel', 'Sturmbrecher-Klippe', 'Mythenschleier-Tiefe', 'Ewigeis-Archipel', 'Nebeldorn-Höhen', 'Saphirwogen-Bucht', 'Ruf der Tiefe', 'Zwielichtnebel-Strand', 'Wolkenbruch-Insel', 'Flammenkamm-Berg', 'Silberquell-Eiland', 'Erzählungen der Alten', 'Windflüster-Spitze', 'Tiefseegeheimnis', 'Sturmlied-Klippen', 'Götterdämmerungs-Archipel', 'Leuchtfeder-Lagune', 'Rätsel des Ozeans', 'Blutmond-Bucht', 'Sternenwächter-Insel', 'Geistertanz-Riff', 'Schwarzflut-Atoll', 'Wisperwind-Tal', 'Träumender Vulkan']

static var DATA: Dictionary = {
	"Kampf":
		['Kampf', 'Kapitän', 'Dich greifen Gegner an!', [eventKey.kampf]],
	"GameOver":
		['Game Over', '', 'Du bist gestorben. Das Königreich wird ohne dich die Wellen nicht zurück schlagen können und die Welt wird erneut überrant. Doch ein paar wenige bleiben verschont um die Welt erneut wieder aufzubauen, neue Helden zu beschwören und erneut zu hoffen, dass es diesmal enden wird.', [eventKey.kampf]],
	"Szene1":
		['Beschworene Helden',
		'Königin', 
		'Du wurdest in dieses Land gerufen, um mit den anderen Helden die Wellen, die Woche für Woche auf unsere Heimat losrennen, zu beseitigen. Dafür fährst du mit der ArcheNova Richtung Osten, an den Ort, an dem die Wellen ihren Ursprung nehmen und das Unheil beseitigt, um die Wellen aufzuhalten. Hierfür stellen wir euch 20 Goldmünzen und 2 Vertreute zu Verfügung die euch unterstützen. Wählt euch aus, welche Vertrauten ihr euch aussucht.', 
		[eventKey.szene1]],
	"Szene2":
		['Auf hoher See', 
		'Kapitän', 
		'Es ist mir eine Freude euch werter Held an Bord zu haben. Bitte sprecht mit mir, wenn ihr etwas braucht, ich bin zu jederzeit für euch da und helfe wo ich kann. Bitte ruht euch erstmal aus, morgen bespreche ich mit euch den Kurs, den wir nehmen werden.', 
		[eventKey.szene2]],
	"Szene3":
		['Kurz vor der letzten Welle', 
		'Kapitän', 
		'Wir erreichen nun das Auge des Weltesturms. Macht euch bereit, gegen die schrecklichsten aller Monster antreten zu müssen. Nur Gott weiß, wie viel auf uns zukommt und ob ihr bereit seid, gegen die Monster zu widerstehen.', 
		[eventKey.szene3]],
	"Szene4":
		['Tag nach der letzten Welle', 
		'Königin', 
		'Vielen Dank ihr Helden. Ihr habt euren Beitrag, diese Welt zu retten, mehr als nur erfüllt. Wir sind euch zutiefst dankbar, dass ihr uns, diesem Kontinent und dessen Bewohnern, wieder Jahre des Friedens geschenkt habt. Bis die Wellen wiederkommen und wir erneut die Hilfe der 4 Helden brauchen. Doch ihr habt euer Ziel erfüllt, daher schicken wir euch nun in eure Welt zurück.', 
		[eventKey.szene1]],
}

func random_insel_name() -> String:
	return inselNamen.pick_random();
