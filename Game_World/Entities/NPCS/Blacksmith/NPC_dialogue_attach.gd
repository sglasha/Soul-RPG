extends Area2D

@export var data : NPC

func _on_body_entered(body: Node2D) -> void:
	body.get_node("Dialogue").data = data
	body.get_node("Dialogue").visible = true
	body.get_node("Dialogue").load_dialogue()
	
	body.get_node("Dialogue").data = data
	body.get_node("Dialogue").visible = true
	body.get_node("Dialogue").load_dialogue()



func _on_body_exited(body: Node2D) -> void:
	body.get_node("Dialogue").visible = false
