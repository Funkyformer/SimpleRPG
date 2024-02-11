extends Node2D

var enemies : Array = []
var action_queue: Array = []
var is_acting: bool = false
var index: int = 0

signal next_player
signal combat_end
@onready var choice = $"../CanvasLayer/choice"

# Called when the node enters the scene tree for the first time.
func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*140)
	
	show_choice()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not choice.visible:
		if Input.is_action_just_pressed("move_up"):
			if index > 0:
				index -= 1
				switch_focus(index, index+1)
		if Input.is_action_just_pressed("move_down"):
			if index < enemies.size()-1:
				index += 1
				switch_focus(index, index-1)
		if Input.is_action_just_pressed("ui_accept"):
			action_queue.push_back(index)
			next_player.emit()
		
		if action_queue.size() == enemies.size() and not is_acting:
			is_acting = true
			_action(action_queue)

func _action(stack):
	for i in stack:
		enemies[i].take_damage(3)
		await get_tree().create_timer(1).timeout
	action_queue.clear()
	is_acting = false
	show_choice()
	var totalhp = 0
	for i in enemies:
		totalhp += i.health
	if totalhp <= 0:
		combat_end.emit()
		print("Combat End Detected")

func switch_focus(x, y):
	enemies[x].focus()
	enemies[y].unfocus()

func show_choice():
	choice.show()
	choice.find_child("Attack").grab_focus()

func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()

func _start_choosing():
	_reset_focus()
	enemies[0].focus()


func _on_attack_pressed():
	choice.hide()
	_start_choosing()
