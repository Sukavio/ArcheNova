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

func _on_dice_tray_results_ready(moveNr: int):
	match status:
		FightStatus.Player:
			var damage = maxi(spieler.atk + %DiceTray.hit - gegner.totalDef(), 0) + %DiceTray.krit * 2
			match moveNr:
				1:
					damage += %DiceTray.magic
				2:
					damage += %DiceTray.magic * spieler.magic
				3:
					spieler.hp_value += %DiceTray.hit + %DiceTray.krit * 2
			gegner.hp_value -= damage
			openDialog = true
			%Dialog.text = str(spieler.name, ' greift ', gegner.bezeichnung, ' an und macht ', damage, ' Schaden!')
			if gegner.hp_value <= 0:
				%Dialog.text += str('\n', gegner.bezeichnung, " ist gestorben!")
				gegner.queue_free()
				status = FightStatus.Win
			else:
				status = FightStatus.Enemy
		FightStatus.Enemy:
			var damage = maxi(gegner.totalAtk() + %DiceTray.hit - spieler.def, 0) + %DiceTray.krit * 2
			spieler.hp_value -= damage
			%Dialog.text = str(gegner.bezeichnung, ' greift ', spieler.name, ' mit ', gegner.angriff.bezeichnung, ' an und macht ', damage, ' Schaden!')
			if spieler.hp_value <= 0:
				%Dialog.text += str('\n', spieler.name, " ist gestorben!")
				spieler.queue_free()
				status = FightStatus.Lose
			else:
				status = FightStatus.Player

func _on_dialog_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 && event.pressed:
			match status:
				FightStatus.Player:
					openDialog = false
					%DiceTray.unpause()
				FightStatus.Enemy:
					%DiceTray.next(gegner.angriff.dices)
				FightStatus.Win:
					%Dialog.text = 'Du hast gewonnen!'
					status = FightStatus.End
				FightStatus.Lose:
					%Dialog.text = 'Du hast verloren!'
					status = FightStatus.End
				FightStatus.End:
					get_tree().change_scene_to_file("res://szenen/startseite.tscn")
