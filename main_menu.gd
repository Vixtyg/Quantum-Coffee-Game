extends Node2D
#=======================================================================================
#=======================================================================================
#===================================NEW=================================================
@export var my_dialogue: DialogueResource
var states_list : Dictionary = { 
	some_variable = false
}
#=======================================================================================
#=======================================================================================


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#=======================================================================================
	#===================================NEW=================================================
	DialogueManager.show_dialogue_balloon(my_dialogue, "start", [states_list])
	#=======================================================================================
	#=======================================================================================


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


#=======================================================================================
#=======================================================================================
#===================================NEW=================================================
#=======================================================================================
#=======================================================================================
const MENU_SCENE_PATH = "res://node_2d.tscn"


func _unhandled_input(event: InputEvent) -> void:
	# Check if the "ui_cancel" (Escape) key was just pressed
	if event.is_action_pressed("ui_cancel"):
		open_menu_scene()

func open_menu_scene() -> void:
	# Change the current scene to the new one
	get_tree().change_scene_to_file(MENU_SCENE_PATH)
