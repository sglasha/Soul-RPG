extends CharacterBody2D

@export var sprite : AnimatedSprite2D

var noise = FastNoiseLite.new()
var base_speed = 400
var noise_speed = 2
var chasing = false
var noise_position = 0
var direction = Vector2(0,0)
var speed

var rand_x = randi_range(0,100)
var rand_y = randi_range(0, 100)

func _ready():
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.frequency = 0.05

func _physics_process(delta: float) -> void:
	if not chasing:
		speed = base_speed
		noise_position += delta * noise_speed
		direction = Vector2(noise.get_noise_2d(0,noise_position + rand_y),noise.get_noise_2d(noise_position + rand_x, 0))
		
	else:
		speed = base_speed * 1.5
		for node in get_tree().get_nodes_in_group('chased'):
			# get vector towards chased targets
			direction = (node.position - position).normalized()
			
	velocity = speed * direction
	
	move_and_slide()
