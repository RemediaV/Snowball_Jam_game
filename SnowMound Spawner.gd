extends Node2D

var snow_mound_preload= preload("res://Scenes/snow_mound.tscn")
var random_spawn = 500
var snow_mound_count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if snow_mound_count < 5:
		random_spawn += randi() % 5
	if random_spawn > 500:
		var snow_mound = snow_mound_preload.instantiate()
		snow_mound.position = Vector2(randf_range(50.0,250.0),randf_range(40.0,720-10))
		get_parent().add_child(snow_mound)
		random_spawn = 0
		snow_mound_count += 1
