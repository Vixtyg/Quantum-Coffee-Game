extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#place with function body.
	$MainChar/Camera2D.set_lims(0,1500,-1900,2100)
	$MainChar/Camera2D.zoom.x=2
	$MainChar/Camera2D.zoom.y=2
	$MainChar.SPEED=300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
