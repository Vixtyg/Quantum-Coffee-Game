extends Area2D
@export var my_dialogue : DialogueResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(my_dialogue, "LevelOne")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	DialogueManager.show_dialogue_balloon(my_dialogue, "LevelOneB")
	
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
# Check if the "ui_cancel" (Escape) key was just pressed
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Motherboard.tscn")
