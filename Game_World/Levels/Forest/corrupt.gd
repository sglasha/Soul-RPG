extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	Constants.corrupt_state = true
	get_tree().change_scene_to_file(Constants.Scene_Paths.village)
