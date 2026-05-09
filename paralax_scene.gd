extends Node2D

@export var leftLimit: int
@export var rightLimit: int
@export var topLimit: int
@export var downLimit: int
@export var zoomFactor: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainChar/Camera2D.limit_left = leftLimit
	$MainChar/Camera2D.limit_right = rightLimit
	$MainChar/Camera2D.limit_top = topLimit
	$MainChar/Camera2D.limit_bottom = downLimit
	$MainChar/Camera2D.zoom *= zoomFactor
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
