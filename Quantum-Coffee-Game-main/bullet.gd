extends CharacterBody2D

@export var speed := 100.0

var direction := Vector2.RIGHT
var time := 0.0


func setup(new_direction: Vector2) -> void:
	direction = new_direction.normalized()
	print("SHOT")


func _physics_process(delta: float) -> void:
	time += delta

	if time > 5:
		queue_free()

	velocity = speed * direction

	var collision = move_and_collide(velocity * delta)

	if collision:
		queue_free()
