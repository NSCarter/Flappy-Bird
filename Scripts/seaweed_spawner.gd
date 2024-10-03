extends Node2D


var SeaweedScene = preload("res://Scenes/Seaweed.tscn")
var game_over = false

var _seaweeds = []


func _process(_delta):
	if not game_over:
		for seaweed in _seaweeds:
			seaweed[0].position.x -= 2
			seaweed[1].position.x -= 2
			
			if seaweed[0].position.x < -80:
				_seaweeds.remove_at(_seaweeds.find(seaweed))
				remove_child(seaweed[0])
				remove_child(seaweed[1])


func _on_spawn_timer_timeout():
	var spawn_pos = randi_range(160, 529)
	var top = _create_seaweed(spawn_pos, true)
	var bottom = _create_seaweed(spawn_pos, false)
	_seaweeds.append([top, bottom])


func _create_seaweed(spawn_pos, is_top):
	var seaweed = SeaweedScene.instantiate() as StaticBody2D
	var rotation_pos = 0
	
	if is_top:
		seaweed.rotation_degrees = 180
		spawn_pos -= 240
		rotation_pos = 80
		var ray_cast = seaweed.get_node("RayCast") as RayCast2D
		ray_cast.enabled = true
		
	seaweed.position = Vector2(1100 + rotation_pos, spawn_pos)
	add_child(seaweed)
	return seaweed
