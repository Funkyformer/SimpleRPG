extends Area2D

var tile_size = 80
var move_delay = 0 # 1 = cannot move, 0 = can
@onready var ray = $RayCast2D
signal player_move;
var actionable;

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE*tile_size)
	position += Vector2.ONE * tile_size/2
	actionable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if actionable:
		if Input.is_action_pressed("move_right") and !Input.is_action_pressed("move_left"):
			move(Vector2.RIGHT)
		if Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right"):
			move(Vector2.LEFT)
		if Input.is_action_pressed("move_up") and !Input.is_action_pressed("move_down"):
			move(Vector2.UP)
		if Input.is_action_pressed("move_down") and !Input.is_action_pressed("move_up"):
			move(Vector2.DOWN)

func move(x):
	face(x)
	ray.target_position = x * tile_size
	if move_delay != 1:
		player_move.emit(position);
		if !ray.is_colliding():
			move_delay = 1
			position += x * tile_size
			if Input.is_action_pressed("sprint"):
				$FastMovementDelay.start()
			else:
				$MovementDelay.start()
			
func face(x):
	match x:
		Vector2.DOWN:
			pass
			#$PlayerSprite.rotation = 0;
		Vector2.UP:
			pass
			#$PlayerSprite.rotation = PI;
		Vector2.LEFT:
			pass
			#$PlayerSprite.rotation = PI/2;
		Vector2.RIGHT:
			pass
			#$PlayerSprite.rotation = 3*PI/2;

func _on_movement_delay_timeout():
	move_delay = 0;

func _on_fast_movement_delay_timeout():
	move_delay = 0;


func _on_main_combat_started():
	actionable = false
	await get_parent().combat_finished
	actionable = true
