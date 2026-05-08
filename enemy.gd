extends CharacterBody2D


enum State {
	IDLE,
	FOLLOW
}

@export var speed = 180
@export var jump_power = 500
@export var player: CharacterBody2D
@export var ray: RayCast2D
var direction = 1
var state = State.IDLE
var time = 0

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
		var collider = ray.get_collider()
		if collider == player:
			speed += 30
			ray.target_position.x *= 0.5
			time = 0
			state = State.FOLLOW
		else:
			print("collided")
			direction *= -1
			ray.target_position.x *= -1
			ray.force_raycast_update()
	pass
	
func follow_state():
	direction = sign(player.global_position.x - global_position.x)
	velocity.x = speed * direction
	ray.target_position.x *= direction
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider != player:
			jump()
	pass
	
func do_physics(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	pass
	
func jump():
	if is_on_floor():
		velocity.y -= jump_power

func die():
	self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match state:
		State.IDLE:
			idle_state()
			pass
		State.FOLLOW:
			time += delta
			follow_state()
			if time > 3:
				die()
			pass
	do_physics(delta)
	move_and_slide()
	pass
