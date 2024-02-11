extends Node2D

@onready var _focus = $Focus
@export var max_health: float = 7
@onready var progress_bar = $health

var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()

func _update_progress_bar():
	progress_bar.value = (health/max_health*100)

func focus():
	_focus.show()

func unfocus():
	_focus.hide()

func take_damage(num):
	health -= num
