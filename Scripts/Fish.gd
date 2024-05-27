extends CharacterBody2D

signal game_over_signal

const JUMP_SPEED = 400
const FALLING_SPEED = 500
var vertical_speed = 0
var game_over_scene = preload("res://Scenes/GameOver.tscn")
var showing_game_over = false


func _process(delta):
	if Input.is_action_just_released("jump"):
		vertical_speed = JUMP_SPEED

	if not showing_game_over:
		position.y -= vertical_speed * delta
		vertical_speed -= FALLING_SPEED * delta


func _physics_process(delta):
	var collision = move_and_slide()
	if collision:
		show_game_over()
		
	
func show_game_over():
	if not showing_game_over:
		showing_game_over = true
		game_over_signal.emit()
		$AudioStreamPlayer2D.play()
		var parent = get_parent().get_parent().get_parent()
		var game_over = game_over_scene.instantiate() as Node2D
		parent.add_child(game_over)
