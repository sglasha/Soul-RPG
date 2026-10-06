extends Node

func _on_body_entered(_body: Node2D) -> void:
	get_tree().reload_current_scene()
	
	# Switch to combat scene, for now we just reset the player in the forest
