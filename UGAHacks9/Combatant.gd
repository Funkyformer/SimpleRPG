#currently not in use
extends Node2D
class_name Combatant

@export var speed : int
@export var health : int
@export var ap : int
@export var initiative : int
var moves = []

# Called when the node enters the scene tree for the first time.
func _ready():
	initiative = speed + randi_range(0, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
