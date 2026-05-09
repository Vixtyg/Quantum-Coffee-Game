extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Visible.start()
	$Visible.timeout.connect(_visible_done)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _visible_done():
	$CollisionShape2D.disabled=true
	$Capacitor2.self_modulate.a=0.2
	$Invisible.start()
	$Invisible.timeout.connect(_invisible_done)
func _invisible_done():
	$CollisionShape2D.disabled=false
	$Capacitor2.self_modulate.a=1
	$Visible.start()
	$Visible.timeout.connect(_visible_done)
