extends CharacterBody2D

@export var speed = 900
var can_roll = true
var standing = false

func _physics_process(delta: float) -> void:
	# Movement Settings
	# Direction
	if not standing:
		var x_direction = Input.get_axis("left","right")
		var y_direction = Input.get_axis("up", "down")
		var direction = Vector2(x_direction, y_direction)
		direction = direction.normalized()
	
		# Player Velocity
		# Horizontal Movement
		if x_direction != 0:
			velocity.x = move_toward(velocity.x, speed*direction.x, float(speed)/8)
		else:
			velocity.x = move_toward(velocity.x, 0, float(speed)/2)
		
		if y_direction != 0:
			velocity.y = move_toward(velocity.y, speed*direction.y, float(speed)/8)
		else:
			velocity.y = move_toward(velocity.y, 0, float(speed)/2)
	
	move_and_slide()
