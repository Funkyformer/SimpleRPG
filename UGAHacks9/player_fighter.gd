extends Node2D

@onready var _focus = $Focus
@onready var progress_bar = $Health

@export var max_health: float = 10

var health: float = 10:
	set(value):
		health = value
		_update_progress_bar()

func _update_progress_bar():
	progress_bar.value = (health/max_health*100)


func focus():
	_focus.show()

func unfocus():
	_focus.hide()
