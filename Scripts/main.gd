extends Node2D


func _ready():
	$Fish/CharacterBody2D.connect("game_ended", _game_over)


func _game_over():
	$SeaweedSpawner.game_over = true
	$Background.game_over = true
	$SeaweedSpawner/SpawnTimer.stop()
