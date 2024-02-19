class_name Kampf extends MarginContainer

@export var spieler: Vertrauter
@export var gegner: Gegner

# Called when the node enters the scene tree for the first time.
func _ready():
	spieler.flip()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dice_tray_results_ready():
	print(str("Hits: ", %DiceTray.hit))	
	print(str("Krits: ", %DiceTray.krit))	
	print(str("Status: ", %DiceTray.status))	
	print(str("Magic: ", %DiceTray.magic))	
	print(str("Ausdauer: ", %DiceTray.ausdauer))
