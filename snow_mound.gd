extends Node2D

var random_upgrade = 0
var upgrade = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Label").text = "Snow_Mound_Sprite lvl " + str(upgrade)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	random_upgrade += randi() % 10
	if random_upgrade > 2000:
		if upgrade < 1:
			upgrade += 1
		random_upgrade = 0
		get_node("Label").text = "Snow_Mound_Sprite lvl " + str(upgrade)
		


func _on_snow_mound_aura_area_entered(area: Area2D) -> void:
	if area.name == "PlayerAura":
		get_tree().get_first_node_in_group("snowball").increase_size(upgrade+1, position)
		get_tree().get_first_node_in_group("snowmoundspawner").snow_mound_count -= 1
		call_deferred("queue_free")
