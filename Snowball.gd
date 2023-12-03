extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
var stop = false
var snowball_size = 0
var speed = 1.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !stop:
		#moving toward player
		position += position.direction_to(player.position) * speed

	


func _on_area_entered(area: Area2D) -> void:
	if area.name == "PlayerAura" or "Snowball":
		stop = true
	if area.name == "SnowMoundAura":
		stop = false
	if area.name == "SnowmanAura":
		get_tree().get_first_node_in_group("snowman").percent_complete += 5*snowball_size 
		reset_to_nothing()


func _on_area_exited(area: Area2D) -> void:
	if area.name == "PlayerAura" or "Snowball":
		stop = false
		
func increase_size(size,pos):
	visible = true
	speed -= .2*size
	position = pos
	snowball_size += size
	if snowball_size > 1:
		scale = Vector2(snowball_size - 1 + .5, snowball_size - 1 + .5)

func reset_to_nothing():
	visible = false
	speed = 1.5
	snowball_size = 0
