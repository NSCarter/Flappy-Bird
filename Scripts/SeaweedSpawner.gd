extends Node2D

var seaweeds = []
var seaweed_scene = preload("res://Scenes/Seaweed.tscn")
var game_over = false


func _process(delta):
	if not game_over:
		for seaweed in seaweeds:
			seaweed[0].position.x -= 2
			seaweed[1].position.x -= 2
			
			if seaweed[0].position.x < -80:
				seaweeds.remove_at(seaweeds.find(seaweed))
				remove_child(seaweed[0])
				remove_child(seaweed[1])


func _on_spawn_timer_timeout():
	var spawn_pos = randi_range(160, 529)
	var top = create_seaweed(spawn_pos, true)
	var bottom = create_seaweed(spawn_pos, false)
	seaweeds.append([top, bottom])
	
func create_seaweed(spawn_pos, is_top):
	var seaweed = seaweed_scene.instantiate() as StaticBody2D
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
