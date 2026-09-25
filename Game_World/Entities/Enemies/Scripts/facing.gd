extends Node2D

@export var entity : CharacterBody2D
var fov = 80
var detection_radius = 1000

func _process(_delta: float) -> void:
	var pos = entity.position
	
	for node in get_tree().get_nodes_in_group('chased'):
		# get vector towards chased targets
		var direction_of_target = (node.position - pos).normalized()
		# normalize entity direction to allow dot product to work for this application
		var direction = entity.direction.normalized()
		
		# do vector math to ensure that entity sees player
		if pos.distance_to(node.position) < detection_radius:
			var dot_product = direction.dot(direction_of_target)
			var angle_to_node = rad_to_deg(acos(dot_product))
			if abs(angle_to_node) < int(float(fov)/2):
				entity.chasing = true
				
			else:
				entity.chasing = false
		else:
			entity.chasing = false
