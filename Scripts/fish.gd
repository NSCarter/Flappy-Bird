extends CharacterBody2D


signal game_ended

const JUMP_SPEED = 400
const FALLING_SPEED = 500

var GameOverScene = preload("res://Scenes/GameOver.tscn")

var _vertical_speed = 0
var _showing_game_over = false


func _process(delta):
	if Input.is_action_just_released("jump"):
		_vertical_speed = JUMP_SPEED

	if not _showing_game_over:
		position.y -= _vertical_speed * delta
		_vertical_speed -= FALLING_SPEED * delta


func _physics_process(_delta):
	var collision = move_and_slide()
	if collision:
		_show_game_over()


func _show_game_over():
	if not _showing_game_over:
		_showing_game_over = true
		game_ended.emit()
		$AudioStreamPlayer2D.play()
		var parent = get_parent().get_parent().get_parent()
		var game_over = GameOverScene.instantiate() as Node2D
		parent.add_child(game_over)
