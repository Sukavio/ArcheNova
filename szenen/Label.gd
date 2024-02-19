extends Label

@export var progress_bar: ProgressBar

func _process(delta):
	text = str(progress_bar.value, " / ", progress_bar.max_value)
