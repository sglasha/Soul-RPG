extends Node2D

@export var player : CharacterBody2D
@export var roll_timer : Timer
@export var roll_speed_multiplier = 2
var rolling = false
var direction = Vector2(0,0)

func _physics_process(delta: float) -> void:
	# calculate direction from player velocity, limit direction between -1 and 1 to prevent compounding roll speed
	# Diagonal
	if player.velocity != Vector2(0,0):
		direction = player.velocity.normalized()
		
	
	if Input.is_action_pressed("roll") and not rolling:
		roll_timer.start()
		rolling = true
	
	if rolling:
		player.velocity = player.speed * direction * roll_speed_multiplier


func _on_roll_timer_timeout() -> void:
	rolling = false
