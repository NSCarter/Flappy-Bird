extends Node

signal score_changed(score)
var _score = 0

func set_score(score):
	_score = score
	score_changed.emit(score)
	
func get_score():
	return _score
