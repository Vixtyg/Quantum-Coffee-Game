extends CharacterBody2D


enum State {
	FLY,
	CHARGE,
}

@export var speed = 70
@export var player: CharacterBody2D
@export var range = 100
@export var bullet: PackedScene
var time
var dist = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player == null:
		player = $"../MainCharacter"
		time = 0
		
func shoot() -> void:
	if bullet == null or player == null:
		return

	var new_bullet = bullet.instantiate()
	get_tree().current_scene.add_child(new_bullet)

	new_bullet.global_position = global_position

	var dir_to_player = (player.global_position - new_bullet.global_position).normalized()

	if new_bullet.has_method("setup"):
		new_bullet.setup(dir_to_player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	dist = global_position.distance_to(player.global_position)
	if dist < range:
		print("dist to player = ", dist)
		if time > 3:
			print("shoot")
			shoot()
			time = 0
			pass
			
	time += delta
		
	pass
