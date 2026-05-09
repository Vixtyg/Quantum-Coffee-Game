extends Camera2D

#Camera Limits

var leftLim
var rightLim
var topLim
var bottomLim
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_smoothing()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func set_lims(a,b,c,d):
	print(a,b,c,d)
	limit_left=a
	limit_right=b
	limit_top=c
	limit_bottom=d
