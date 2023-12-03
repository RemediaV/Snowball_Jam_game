extends Node2D

var percent_complete = 0
@export var snowman_part_name = 'head'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Name").text = 'Snowman_'+ snowman_part_name.to_upper()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if int(get_node("Prog").text.replace("%", "")) != percent_complete:
		get_node("Prog").text = str(percent_complete) + "%"


func collected(amount):
	match snowman_part_name:
		'head':
			if percent_complete != 100:
				get_tree().get_first_node_in_group('snowball').reset_to_nothing()
			percent_complete += 50*amount
			if percent_complete > 100:
				percent_complete = 100
			
		'torso':
			if percent_complete != 100:
				get_tree().get_first_node_in_group('snowball').reset_to_nothing()
			percent_complete += 33*amount
			if percent_complete >= 99:
				percent_complete = 100
		'body':
			if percent_complete != 100:
				get_tree().get_first_node_in_group('snowball').reset_to_nothing()
			percent_complete += 25*amount
			if percent_complete > 100:
				percent_complete = 100
