extends CharacterBody2D

@onready var player = $"../Player"
var speed = 50

var get_player_pos = player.global_position 

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func calculate_direction_to_player():
	var direction_to_player = (player.global_position - global_position).normalized()
	
	# Determine direction based on components
	if abs(direction_to_player.x) > abs(direction_to_player.y):
		# Player is left or right
		if direction_to_player.x < 0:
			return Vector2.LEFT
		else:
			return Vector2.RIGHT
	else:
		# Player is up or down
		if direction_to_player.y < 0:
			return Vector2.UP
		else:
			return Vector2.DOWN

func _physics_process(delta):
	calculate_direction_to_player()
	move_and_slide()
	
