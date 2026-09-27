extends Node2D

@export var player : CharacterBody2D
@export var roll_timer : Timer
@export var cooldown : Timer
@export var roll_speed_multiplier = 2
var rolling = false
var direction = Vector2(0,0)

func _physics_process(delta: float) -> void:
	# calculate direction from player velocity, limit direction between -1 and 1 to prevent compounding roll speed
	# Diagonal
	if player.velocity != Vector2(0,0):
		direction = player.velocity.normalized()
		
	
	if Input.is_action_just_pressed("roll") and player.can_roll and direction != Vector2(0,0):
		roll_timer.start()
		rolling = true
		player.can_roll = false
		
	
	if rolling:
		player.velocity = player.speed * direction * roll_speed_multiplier

func _on_roll_timer_timeout() -> void:
	rolling = false
	cooldown.start()

func _on_roll_cooldown_timeout() -> void:
	player.can_roll = true
