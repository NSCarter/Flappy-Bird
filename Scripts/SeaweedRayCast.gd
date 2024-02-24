extends RayCast2D

var passing_through = false


func _process(delta):
	if is_colliding():
		if !passing_through:
			passing_through = true
	else:
		if passing_through:
			passing_through = false
			Stats.set_score(Stats._score + 1)
