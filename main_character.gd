extends CharacterBody2D


var SPEED = 300.0
var doubleJumped=false;
const JUMP_VELOCITY = -700.0
const ACC=25

var bullet = preload("res://bullet.tscn")
#This tracks movement
#Parry mechanic. Mosfet puzzle
#COFFEE SPEED BOOST!
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if Input.is_action_just_pressed("ui_accept")&&doubleJumped==false:
			velocity.y=JUMP_VELOCITY*0.7
			doubleJumped=true
	if is_on_floor():
		doubleJumped=false;
	#Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("Run"):
		if SPEED<600==true:
			SPEED+=ACC
	if Input.is_action_pressed("Run")!=true:
		if SPEED>300==true:
			SPEED-=ACC
	move_and_slide()
	if Input.is_action_just_pressed("Dash"):
		bullet.instantiate()
		add_child(bullet.instantiate())
		SPEED=2000
		$DashTimer.start()
		$DashTimer.timeout.connect(_on_timeout)
	if Input.is_action_just_pressed("Stomp"):
		velocity.y+=3000
func _on_timeout():
	SPEED=300
	
	print("@")
func _on_timeout_up():
	print("@")
