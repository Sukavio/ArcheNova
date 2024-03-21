extends Node2D

const EventDB = preload("res://assets/db/eventDB.gd")

var szenen = ['Szene1', 'Szene2', 'Szene3', 'Szene4']

@onready var dialog = %Dialog as RichTextLabel
@onready var timer = $TextAnimation as Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	tag_to_szene(GameManager.tag)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func load_szene(szene: String):
	var event = EventDB.DATA.get(szene)
	set_dialog_data(event[0], event[2], event[1])
	
func set_dialog_data(titel: String, text: String, speaker: String = ''):
	%Titel.text = titel
	%Speaker.text = speaker
	%Speaker.visible = speaker != ''
	dialog.text = text
	dialog.visible_ratio = 0.0
	timer.start()

func _on_text_animation_timeout():
	dialog.visible_characters += 2
	if dialog.visible_ratio == 1.0:
		timer.stop()

func _on_dialog_gui_input(event: InputEventMouseButton):
	if event.button_index == 1 and event.pressed:
		if dialog.visible_ratio != 1.0:
			dialog.visible_ratio = 1.0
			timer.stop()
		else:
			if not GameManager.eventFinished:
				if GameManager.gameOver:
					get_tree().change_scene_to_file("res://szenen/startseite.tscn")
				elif GameManager.etype == GameManager.EventType.Kampf:
					GameManager.tag += 1
					get_tree().change_scene_to_file("res://szenen/kampf.tscn")
				else:
					GameManager.tag += 1
					GameManager.eventFinished = true
					tag_to_szene(GameManager.tag)
		
func tag_to_szene(tag: int):
	GameManager.eventFinished = false
	if GameManager.gameOver:
		load_szene('GameOver')
	else:
		GameManager.etype = GameManager.EventType.Lesen
		match tag:
			-1: load_szene('Szene1')
			0:  load_szene('Szene2')
			1, 2, 3, 4, 5, 6, 7, 8: create_random_encounter(tag)
			9:  load_szene('Szene3')
			10: load_szene('Szene4')
			_: get_tree().change_scene_to_file("res://szenen/startseite.tscn")

func create_random_encounter(tag: int):
	var inselName = EventDB.inselNamen.pick_random()
	GameManager.monster[0] = MonsterDB.rand(1)
	set_dialog_data(inselName, 'Wir kommen bald auf den %s an. Diese Insel ist bekannt für das Monster %s.' % [inselName, GameManager.monster[0][0].capitalize()], "Kapitän")
	GameManager.etype = GameManager.EventType.Kampf;
