extends Area2D

var colliding=false
const player = preload("res://main_char.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="MainChar":
		print("player in")
		colliding=true
	print(body.get_name()) # Replace with function body.
func get_colliding_state()->bool:
	return colliding

func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
