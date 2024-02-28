class_name Gegner extends Entitaet

var dead := false
var ko := false

@export() var alpha = false
@export() var legendary = false
@export() var shiny = false
@export() var raid = false

func _ready():
	change_monster(MonsterDB.rand(1));
	reload()

func change_monster(monsterDaten: Array):
	bezeichnung = monsterDaten[0].capitalize()
	hp = monsterDaten[1]
	atk = monsterDaten[2]
	speed = monsterDaten[3]
	magic = monsterDaten[4]
	def = monsterDaten[5]
	typ = monsterDaten[7]
	stufe = monsterDaten[8]
	angriff.append(AttackeDB.DATA.get(monsterDaten[9]))
	random()
	ivPro = rand_IV()
	ivNeg = rand_IV()
	if raid:
		($Avatar as TextureRect).custom_minimum_size = Vector2(0, 600)
		bezeichnung = str("Raidboss ", bezeichnung)
	else:
		($Avatar as TextureRect).custom_minimum_size = Vector2(0, 500)
	if alpha:
		$Avatar/Alpha.visible = true
	else:
		$Avatar/Alpha.visible = false
	if legendary:
		bezeichnung = str("Legendäres ", bezeichnung)
	$Avatar.texture = load(str("res://assets/monster/", monsterDaten[8], "/", monsterDaten[0], ".png"))
	$Avatar.flip_h = monsterDaten[6]
	reload()
	
func random():
	legendary = randi_range(1, 10) > 9
	alpha = randi_range(1, 10) > 9
	raid = randi_range(1, 10) > 9
	
func legendary_bonus():
	return 2 if legendary else 0

func totalHP():
	return maxi(super.totalHP() + (2 if alpha else 0) + legendary_bonus() + (5 if raid else 0), 2)
	
func totalAtk():
	return maxi(super.totalAtk() + (1 if alpha else 0) + legendary_bonus(), 0)
	
func totalDef():
	return maxi(super.totalDef() + legendary_bonus(), 0)
	
func totalSpeed():
	return maxi(super.totalSpeed() + legendary_bonus(), 0)
	
func totalMagic():
	return maxi(super.totalMagic() + legendary_bonus(), 0)
