extends CharacterBody2D

var noise = FastNoiseLite.new()
var speed = 400
var noise_speed = 5
var chasing = false
var noise_position = 0

func _ready():
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.frequency = 0.05

func _physics_process(delta: float) -> void:
	if not chasing:
		noise_position += delta * noise_speed
		var direction = Vector2(noise.get_noise_2d(0,noise_position),noise.get_noise_2d(noise_position + 100, 0))
	
		velocity = direction * speed
	
	move_and_slide()
