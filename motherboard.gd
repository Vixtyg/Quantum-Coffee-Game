extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$MainChar/Camera2D.set_lims(0,6200,1948,-600)# Replace with function body.
	$MainChar/Camera2D.zoom.x=1.5
	$MainChar/Camera2D.zoom.y=1.5
	
	$MainChar.set_death_limit(1300)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
