extends CharacterBody2D


enum State {
	IDLE,
	FOLLOW
}

@export var speed = 200
@export var jump_power = 100
@export var player: CharacterBody2D
@export var ray: RayCast2D
var direction = 1
var state = State.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello World")
	if player == null:
		player = $"../MainCharacter"
		print("player found")
	if ray == null:
		ray = find_child("ray")
		print("ray found")
	
	pass # Replace with function body.
	
func idle_state():
	velocity.x = speed * direction
	if ray.is_colliding():
		print("collided")
		direction *= -1
		ray.target_position.x *= -1
	pass
	
func do_physics(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	pass
	
func jump():
	if is_on_floor():
		velocity.y += jump_power


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match state:
		State.IDLE:
			idle_state()
			pass
		State.FOLLOW:
			pass
	move_and_slide()
	pass
