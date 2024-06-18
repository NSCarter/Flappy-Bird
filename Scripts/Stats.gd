extends Node

signal score_changed(score)
var _score = 0
var high_score = 0
var save_high_score = false

func _ready():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	high_score = int(save_file.get_as_text())

func set_score(score):
	_score = score
	score_changed.emit(score)
	
	if score > high_score:
		high_score = score
		save_high_score = true
	
func get_score():
	return _score
