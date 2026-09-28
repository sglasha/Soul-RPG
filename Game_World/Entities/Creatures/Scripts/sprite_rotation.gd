extends Node2D

@export var sprite: AnimatedSprite2D
@export var creature: CharacterBody2D

func _process(_delta: float) -> void:
	sprite.set_rotation(creature.direction.angle() + 90)
