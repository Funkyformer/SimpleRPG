extends Node

signal combat_started()
signal combat_finished()

var combat_scene = load("res://combat_2.tscn")
var scene_instance = combat_scene.instantiate()
@onready var map = $Map


# Called when the node enters the scene tree for the first time.
func _ready():
	map.visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_character_player_move(pos):
	var combat_chance = 100*randf()
	if combat_chance <= 4:
		combat_begin();
		#pass

func combat_begin():
	combat_started.emit()
	#$Combat.combat_start();
	if scene_instance == null: scene_instance = combat_scene.instantiate()
	#scene_instance.set_name("combat_scene")
	add_child(scene_instance)
	scene_instance.combat_2_end.connect(_on_combat_2_combat_2_end)


#func _on_combat_2_encoutner_1_combat_end():
	#combat_finished.emit()
	#scene_instance.queue_free()
	#print("Killing Combat")


func _on_combat_2_combat_2_end():
	print("Starting to kill combat")
	combat_finished.emit()
	scene_instance.queue_free()
	scene_instance = null;
	print("Killing Combat")
