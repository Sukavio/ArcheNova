class_name Kampf extends MarginContainer

@export var spieler: Vertrauter
@export var gegner: Gegner

enum FightStatus {Player, Enemy, Win, Lose, End}

var status = FightStatus.Player

var openDialog = true
var win = false
var enemyAttack = false

func _ready():
	spieler.flip()
	spieler.hp = randi_range(1, 5)
	spieler.atk = randi_range(1, 5)
	spieler.speed = randi_range(1, 5)
	spieler.magic = randi_range(1, 5)
	spieler.def = randi_range(1, 5)
	render_player_attacks()
	var starter = ''
	if spieler.speed > gegner.speed:
		starter = spieler.name
		status = FightStatus.Player
	else:
		starter = gegner.bezeichnung
		status = FightStatus.Enemy
	%Dialog.text = str('Der Kampf zwischen ', spieler.name, ' und ', gegner.bezeichnung, ' beginnt!\n', starter, ' beginnt den Kampf.')

func _process(delta):
	%Dialog.visible = openDialog
	$VBoxContainer/Spielbereich/MarginContainer/MenuBereich/Attacken.visible = !openDialog
			
func render_player_attacks():
	if spieler != null:
		if spieler.angriff.size() > 0:
			%Atk1/VBoxContainer/HBoxContainer/Name.text = spieler.angriff[0].bezeichnung
			%Atk1/VBoxContainer/HBoxContainer/Würfel.text = str(spieler.angriff[0].dices)
			%Atk1/VBoxContainer/Beschreibung.text = spieler.angriff[0].beschreibung
		else:
			%Atk1/VBoxContainer.visible = false
			%Atk1.disable = true
		if spieler.angriff.size() > 1:
			%Atk2/VBoxContainer/HBoxContainer/Name.text = spieler.angriff[1].bezeichnung
			%Atk2/VBoxContainer/HBoxContainer/Würfel.text = str(spieler.angriff[1].dices)
			%Atk2/VBoxContainer/Beschreibung.text = spieler.angriff[1].beschreibung
		else:
			%Atk2/VBoxContainer.visible = false
			%Atk2.disabled = true
		if spieler.angriff.size() > 2:
			%Atk3/VBoxContainer/HBoxContainer/Name.text = spieler.angriff[2].bezeichnung
			%Atk3/VBoxContainer/HBoxContainer/Würfel.text = str(spieler.angriff[2].dices)
			%Atk3/VBoxContainer/Beschreibung.text = spieler.angriff[2].beschreibung
		else:
			%Atk3/VBoxContainer.visible = false
			%Atk3.disabled = true

func _on_dice_tray_results_ready(moveNr: int, result: DiceRollResult):
	match status:
		FightStatus.Player:
			var damage = Schadensberechnung._calculiere_schaden(spieler, gegner, moveNr, result)
			openDialog = true
			%Dialog.text = str(spieler.name, ' greift ', gegner.bezeichnung, ' an und macht ', damage, ' Schaden!')
			if !gegner.alive:
				%Dialog.text += str('\n', gegner.bezeichnung, " ist gestorben!")
				gegner.queue_free()
				status = FightStatus.Win
			else:
				status = FightStatus.Enemy
		FightStatus.Enemy:
			var damage = Schadensberechnung._calculiere_schaden(gegner, spieler, moveNr, result)
			%Dialog.text = str(gegner.bezeichnung, ' greift ', spieler.bezeichnung, ' mit ', gegner.angriff[0].bezeichnung, ' an und macht ', damage, ' Schaden!')
			if !spieler.alive:
				%Dialog.text += str('\n', spieler.name, " ist gestorben!")
				spieler.queue_free()
				status = FightStatus.Lose
			else:
				render_player_attacks()
				status = FightStatus.Player

func _on_dialog_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 && event.pressed:
			match status:
				FightStatus.Player:
					openDialog = false
					%DiceTray.unpause()
				FightStatus.Enemy:
					%DiceTray.next(gegner.angriff[0].dices)
				FightStatus.Win:
					%Dialog.text = 'Du hast gewonnen!'
					status = FightStatus.End
				FightStatus.Lose:
					%Dialog.text = 'Du hast verloren!'
					status = FightStatus.End
				FightStatus.End:
					get_tree().change_scene_to_file("res://szenen/startseite.tscn")
