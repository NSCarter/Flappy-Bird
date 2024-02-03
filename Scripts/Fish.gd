extends CharacterBody2D

var key_pressed = false
const JUMP_SPEED = 400
const FALLING_SPEED = 500
var vertical_speed = 0
var collided = false


func _process(delta):
	if not collided:
		if Input.is_action_just_released("jump"):
			vertical_speed = JUMP_SPEED

		position.y -= vertical_speed * delta
		vertical_speed -= FALLING_SPEED * delta
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		vertical_speed = 0
		collided = true

