#curretly not in use
extends Node2D

class_name TurnQueue
signal turn_end()

#@onready var active_character : Fighter

func initialize():
	var fighters = get_fighters()
	fighters.sort_custom(self, 'sort_fighters')
	for fighter in fighters:
		fighter.raise()
	#active_character = get_child(0)
	
#static func sort_fighters(a : Fighter, b : Fighter) -> bool:
	#return a.stats.speed > b.stats.speed
#
#func play_turn(target : Battler, action : CombatAction):
	#await turn_end
	#var new_index = (active_character.get_index() + 1) % get_child_count()
	#active_character = get_child(new_index)

func get_fighters():
	pass
