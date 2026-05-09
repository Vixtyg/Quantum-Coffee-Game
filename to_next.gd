extends Area2D

#@export var next_scene: String = "res://Scenes/NextLevel.tscn"
@export var my_dialogue : DialogueResource

# Called when the node enters the scene tree for the first time.
var triggered := false


func _on_body_entered(body: Node2D) -> void:
	if triggered:
		return


	triggered = true
	monitoring = false
	
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://ascii_inside.tscn")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(my_dialogue, "levelZero")
