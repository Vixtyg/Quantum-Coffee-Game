extends CharacterBody2D

@export var speed = 90
var dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = dir * speed
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		dir = dir.bounce(collision.get_normal())
	pass
