extends Node2D

const MAX_HEALTH = 5
var health = 3 #TODO: It should be set in the game (and can be reduced by damage() func)

func _ready() -> void:
	update_health_ui()
	$HealthBar.max_value = MAX_HEALTH

func update_health_ui():
	set_health_label()
	set_health_bar()

func set_health_label() -> void:
	$HealthLabel.text = "Health: %s" % health

func set_health_bar() -> void:
	$HealthBar.value = health

func _input(event: InputEvent) -> void:
	if event.as_text() == 'Space' and event.is_pressed(): #place holder for damage
		damage()
	if event.as_text() == 'Enter' and event.is_pressed(): #place holder for heal
		heal()

func damage() -> void:
	health -= 1
	if health < 0:
		health = MAX_HEALTH
	update_health_ui()

func heal() -> void:
	health += 1
	if health > MAX_HEALTH:
		health = 0
	update_health_ui()
