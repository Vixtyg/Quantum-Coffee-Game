extends CharacterBody2D

var direction=1

func _physics_process(delta: float) -> void:
	if direction:
		velocity.x=9000*direction
	print(direction)
	move_and_slide()
func set_direction(given_direction):
	print(given_direction)
	
