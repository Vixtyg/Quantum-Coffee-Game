extends Area2D
@export var my_dialogue : DialogueResource

var label: Label

func _ready() -> void:
	label = find_child("Label", true, false) as Label
	
	
	if label != null:
		label.visible = false
		
func interact():
	print("Pressed E")
	get_tree().change_scene_to_file("res://Verticaldrop.tscn")
	DialogueManager.show_dialogue_balloon(my_dialogue,"start")
	pass
		
func _process(delta: float) -> void:
	# NEEDED TO ADD interact IN INPUTS
	if label.visible and Input.is_action_just_pressed("interaction"):
		interact()


func _on_body_entered(body: Node2D) -> void:
	if label != null:
		label.visible = true


func _on_body_exited(body: Node2D) -> void:
		if label != null:
			label.visible = false
