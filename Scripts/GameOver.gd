extends Node2D

signal reset

func _ready():
	$Background/Score.text = str(Stats.get_score())


func _on_button_pressed():
	get_tree().reload_current_scene()
	Stats.set_score(0)
	queue_free()
