extends CharacterBody2D

@export var speed = 900

func _physics_process(delta: float) -> void:
	# Movement Settings
	# Direction
	var x_direction = Input.get_axis("left","right")
	var y_direction = Input.get_axis("up", "down")
	
	# Player Velocity
	# Horizontal Movement
	if x_direction != 0:
		velocity.x = move_toward(velocity.x, speed*x_direction, float(speed)/8)
	else:
		velocity.x = move_toward(velocity.x, 0, float(speed)/2)
		
	if y_direction != 0:
		velocity.y = move_toward(velocity.y, speed*y_direction, float(speed)/8)
	else:
		velocity.y = move_toward(velocity.y, 0, float(speed)/2)
	
	move_and_slide()
