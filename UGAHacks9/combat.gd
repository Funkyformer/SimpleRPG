extends Node2D
signal combat_end

# Called when the node enters the scene tree for the first time.
func _ready():
	$sample.hide()
	#$CombatTimer.start();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func combat_start():
	$sample.show();
	$CombatTimer.start()
	print("Combat Start")

func _on_combat_timer_timeout():
	$sample.hide()
	print("Combat End")
	combat_end.emit()
