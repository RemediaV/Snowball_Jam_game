extends CharacterBody2D

@export var speed := 500

#Map a direction to a frame index of AnimatedSprite node's sprite frames. For Future
#var _sprites := {Vector2.RIGHT: 1, Vector2.LEFT: 2, Vector2.UP: 3, Vector2.DOWN: 4}
var new_speed = speed


func _physics_process(_delta: float) -> void:
	# Call `Input.get_action_strength()` to support analog movement.
	var direction := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	# limit the vector's length to ensure the player can't go beyond the maximum speed.
	if direction.length() > 1.0:
		direction = direction.normalized()
	if direction.length() == 0:
		velocity = Vector2.ZERO
	
	velocity = direction * speed
	
	move_and_slide()


# The code below updates the character's sprite to look in a specific direction.
#func _unhandled_input(event):
#	if event.is_action_pressed("right"):
#		_update_sprite(Vector2.RIGHT)
#	elif event.is_action_pressed("left"):
#		_update_sprite(Vector2.LEFT)
#	elif event.is_action_pressed("down"):
#		_update_sprite(Vector2.DOWN)
#	elif event.is_action_pressed("up"):
#		_update_sprite(Vector2.UP)


#func _update_sprite(direction: Vector2) -> void:
#	animated_sprite.frame = _sprites[direction]


func _on_player_aura_area_entered(area: Area2D) -> void:
	print(area)
