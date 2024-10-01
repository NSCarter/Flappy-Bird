extends Node2D

var sea1Speed = 1
var sea2Speed = 0.5


func _process(delta: float) -> void:
	$Sea1.position = Vector2($Sea1.position.x - sea1Speed, $Sea1.position.y)
	$Sea2.position = Vector2($Sea2.position.x - sea2Speed, $Sea2.position.y)
	
	if $Sea1.position.x <= -1152:
		$Sea1.position = Vector2(0, $Sea1.position.y)
		
	if $Sea2.position.x <= -1152:
		$Sea2.position = Vector2(0, $Sea2.position.y)
