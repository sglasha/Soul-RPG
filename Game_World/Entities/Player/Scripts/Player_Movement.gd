extends CharacterBody2D

@export var speed = 900
@onready var animation = $AnimatedSprite2D
var can_roll = true
var standing = false
var last_direction = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	# Movement Settings
	# Direction
	if not standing:
		var x_direction = Input.get_axis("left","right")
		var y_direction = Input.get_axis("up", "down")
		var direction = Vector2(x_direction, y_direction)
		direction = direction.normalized()
		if direction != Vector2(0,0):
			last_direction = direction
	
		# Player Velocity
		# Horizontal Movement
		if x_direction != 0:
			velocity.x = move_toward(velocity.x, speed*direction.x, float(speed)/8)
		else:
			velocity.x = move_toward(velocity.x, 0, float(speed)/4)
		
		if y_direction != 0:
			velocity.y = move_toward(velocity.y, speed*direction.y, float(speed)/8)
		else:
			velocity.y = move_toward(velocity.y, 0, float(speed)/4)
			
		# Animation Changes
		if direction != Vector2(0,0):
			if abs(direction.x) >= abs(direction.y):
				if direction.x < 0:
					animation.play("Walk_Left")
				if direction.x > 0:
					animation.play("Walk_Right")
			else:
				if direction.y < 0:
					animation.play("Walk_Up")
				if direction.y > 0:
					animation.play("Walk_Down")
		else:
			if abs(last_direction.x) >= abs(last_direction.y):
				if last_direction.x < 0:
					animation.play("Idle_Left")
				if last_direction.x > 0:
					animation.play("Idle_Right")
			else:
				if last_direction.y < 0:
					animation.play("Idle_Up")
				if last_direction.y > 0:
					animation.play("Idle_Down")
	
	move_and_slide()
