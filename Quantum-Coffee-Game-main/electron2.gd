extends CharacterBody2D




func _physics_process(delta: float) -> void:
	
	velocity.x+=1000
	move_and_slide()
