extends KinematicBody2D

var movement = Vector2.ZERO
var gravity = 40
var speed = 500
var jumpSpeed = -1200

var direction = Vector2.LEFT

func _process(delta):
	if Input.is_action_pressed("left"):
		movement.x = -speed
		if $AnimatedSprite.animation != "run" and is_on_floor():
			$AnimatedSprite.animation = "run"
	elif Input.is_action_pressed("right"):
		movement.x = speed
		if $AnimatedSprite.animation != "run" and is_on_floor():
			$AnimatedSprite.animation = "run"
	else:
		movement.x = 0
		$AnimatedSprite.animation = "idle"
	
	if Input.is_action_pressed("jump") and is_on_floor():
		movement.y = jumpSpeed
		$AnimatedSprite.animation = "jump"
		
	if movement.x<0 and direction!=Vector2.LEFT:
		direction = Vector2.LEFT
		scale.x *= -1
	elif movement.x>0 and direction!=Vector2.RIGHT:
		direction = Vector2.RIGHT
		scale.x *= -1
		
		
	
	movement.y += gravity
	movement = move_and_slide(movement, Vector2.UP)
