extends CharacterBody2D

#Limits of platform (dying)

var SPEED = 300
var SPEED1=SPEED
var doubleJumped=false;
const JUMP_VELOCITY = -1000.0
const ACC=25
var boosting
var shrinkingHalf=false
var bullet = preload("res://bullet.tscn")

@onready var animTree = get_node("AnimationTree")
@onready var animState = animTree.get("parameters/playback")
var collidingCore=false
var collidingShrink
var facingDirection=1
#This tracks movement
#Parry mechanic. Mosfet puzzle
#COFFEE SPEED BOOST!
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta*2
		if Input.is_action_just_pressed("jump")&&doubleJumped==false:
			velocity.y=JUMP_VELOCITY*0.7-SPEED
			doubleJumped=true
	if is_on_floor():
		doubleJumped=false;
	#Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction==-1:
		$"Spritesheet(2)".flip_h=true
		facingDirection=-1
	if direction==1:
		$"Spritesheet(2)".flip_h=false
		facingDirection=1
	if direction!=0:
		if is_on_floor()&&velocity.x<SPEED:
			animState.travel("run")
		velocity.x = direction * SPEED
	else:
		if velocity.y==0:
			animState.travel("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor()&&velocity.x<SPEED:
			animState.travel("Jump")
	if boosting:
		velocity.x+=SPEED
	if Input.is_action_pressed("Run"):
		if SPEED<600==true:
			SPEED+=ACC
	if Input.is_action_pressed("Run")!=true:
		if SPEED>300==true:
			SPEED-=ACC
	move_and_slide()
	if Input.is_action_just_pressed("Fire"):
		
		var newBullet=bullet.instantiate()
		newBullet.position.y=position.y
		newBullet.position.x=position.x
		newBullet.direction = Vector2(facingDirection, 0)
		get_parent().add_child(newBullet)
	if Input.is_action_just_pressed("Dash"):
		animState.travel("dash")
		#bullet.instantiate()
		SPEED=2000
		$DashTimer.start()
		$DashTimer.timeout.connect(_on_timeout)
	if Input.is_action_just_pressed("Stomp"):
		velocity.y+=3000
	if collidingCore:
		if Input.is_action_pressed("Stomp"):	
			print("1")
			velocity.y=-1500
			
	print(collidingCore)
	#Misc. Abilities: Shrinkage
	if shrinkingHalf&&scale.x>0.4:
		scale-=Vector2(0.1,0.1)
		$Camera2D.zoom.x*=1.1
		$Camera2D.zoom.y*=1.1
func _on_timeout():
	SPEED=SPEED1
	print("@")
func _on_timeout_up():
	print("@")

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name()=="CORE":
		collidingCore=true
	if body.get_name()=="Board":
		boosting=true
	print(body.get_name())

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_name()=="CORE":
		collidingCore=false # Replace with function body.
	if body.get_name()=="Board":
		boosting=false


func _on_shrinker_body_entered(body: Node2D) -> void:
	pass
	#SHRINK MECHANIC print(b)
	#shrinkingHalf=true # Replace with function body.
