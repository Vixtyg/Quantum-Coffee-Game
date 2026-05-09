extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainChar/Camera2D.set_lims(0,1500,-1900,2100)
	$MainChar/Camera2D.zoom.x=1.7
	$MainChar/Camera2D.zoom.y=1.7
	$MainChar.SPEED=300
	#place with function body.
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
