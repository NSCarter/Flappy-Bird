extends RayCast2D


var _passing_through = false


func _process(_delta):
	if is_colliding():
		if not _passing_through:
			_passing_through = true
	else:
		if _passing_through:
			_passing_through = false
			Stats.set_score(Stats._score + 1)
			$AudioStreamPlayer2D.play()
