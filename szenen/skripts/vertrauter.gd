class_name Vertrauter extends Entitaet

func _ready():
	change_vertrauter(VertrauteDB.rand());
	reload()
	
func change_vertrauter(vertrauteDaten: Array):
	bezeichnung = vertrauteDaten[0].capitalize()
	angriff.append(AttackeDB.DATA.get(vertrauteDaten[9]))
	ivPro = rand_IV()
	ivNeg = rand_IV()
	$Avatar.texture = load(str("res://assets/vertraute/1/", vertrauteDaten[0], ".png"))
	

func flip(): 
	$Avatar.flip_h = true
