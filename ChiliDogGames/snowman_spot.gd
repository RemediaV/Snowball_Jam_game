extends Node2D

var percent_complete = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if int(get_node("Prog").text.replace("%", "")) != percent_complete:
		get_node("Prog").text = str(percent_complete) + "%"
