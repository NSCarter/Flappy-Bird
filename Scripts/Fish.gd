extends CharacterBody2D

const JUMP_SPEED = 400
const FALLING_SPEED = 500
var vertical_speed = 0


func _process(delta):
	if Input.is_action_just_released("jump"):
		vertical_speed = JUMP_SPEED

	position.y -= vertical_speed * delta
	vertical_speed -= FALLING_SPEED * delta


func _physics_process(delta):
	var collision = move_and_slide()
	if collision:
		reset()


func reset():
	get_tree().reload_current_scene()

