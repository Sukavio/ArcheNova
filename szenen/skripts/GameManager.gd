extends Node

enum EventType {Lesen, Kampf}

var tag = -1
var eventFinished = true
var gameOver = false

var etype: EventType = EventType.Lesen

var vertraute = [VertrauteDB.Fenris]
var monster = [MonsterDB.BreezyWooler, false, false, false]

func new_game():
	tag = -1
	eventFinished = true
	gameOver = false
