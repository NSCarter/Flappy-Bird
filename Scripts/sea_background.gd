extends Node2D


var game_over = false

var _sea_1_speed = 1
var _sea_2_speed = 0.5


func _process(_delta: float) -> void:
	if not game_over:
		$Sea1.position = Vector2($Sea1.position.x - _sea_1_speed, $Sea1.position.y)
		$Sea2.position = Vector2($Sea2.position.x - _sea_2_speed, $Sea2.position.y)
		
		if $Sea1.position.x <= -1152:
			$Sea1.position = Vector2(0, $Sea1.position.y)
			
		if $Sea2.position.x <= -1152:
			$Sea2.position = Vector2(0, $Sea2.position.y)
