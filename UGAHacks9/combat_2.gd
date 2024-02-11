extends Node2D

signal combat_2_end
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_encounter_1_combat_end():
	combat_2_end.emit()
	print("Combat 2 Transmit")
