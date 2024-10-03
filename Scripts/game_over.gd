extends Node2D


func _ready():
	$Background/Score.text = str(Stats.get_score())
	$Background/HighScore.text = str(Stats.high_score)
	
	if Stats.save_high_score:
		_save()


func _on_button_pressed():
	get_tree().reload_current_scene()
	Stats.set_score(0)
	queue_free()


func _save():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save_file.store_string(str(Stats.high_score))
	Stats.save_high_score = false
