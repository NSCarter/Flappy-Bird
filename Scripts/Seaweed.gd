extends Node2D

var seaweeds = []


func _process(delta):
	for seaweed in seaweeds:
		seaweed[0][0].position.x -= 2
		seaweed[0][1].position.x -= 2
		seaweed[1][0].position.x -= 2
		seaweed[1][1].position.x -= 2
		
		if seaweed[0][0].position.x < -80:
			seaweeds.remove_at(seaweeds.find(seaweed))
			remove_child(seaweed[0][0])
			remove_child(seaweed[0][1])
			remove_child(seaweed[1][0])
			remove_child(seaweed[1][1])


func _on_spawn_timer_timeout():
	var spawn_pos = randi_range(150, 529)
	var top = create_seaweed(spawn_pos, true)
	var bottom = create_seaweed(spawn_pos, false)
	seaweeds.append([top, bottom])
	
func create_seaweed(spawn_pos, is_top):
	var bottom = TextureRect.new()
	var top = TextureRect.new()
	bottom.texture = load("res://Assets/Images/Seaweed.png")
	top.texture = load("res://Assets/Images/Seaweed top.png")
	var rotation_pos = 0
	
	if is_top:
		top.rotation_degrees = 180
		bottom.rotation_degrees = 180
		spawn_pos -= 230
		rotation_pos = 80
		
	bottom.scale = Vector2(5, 5)
	top.scale = Vector2(5, 5)
	bottom.stretch_mode = TextureRect.STRETCH_TILE
	bottom.set_size(Vector2(16, 580))
	var bottom_pos = 16
	if is_top:
		bottom_pos = -16
	bottom.position = Vector2(1100 + rotation_pos, spawn_pos + bottom_pos)
	top.position = Vector2(1100 + rotation_pos, spawn_pos)
	add_child(bottom)
	add_child(top)
	return [bottom, top]
