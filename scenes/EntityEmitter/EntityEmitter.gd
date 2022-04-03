extends Node2D

export(Array, PackedScene) var entity_array

onready var timer = $Timer

var lanes = [[20,70], [90, 150], [200, 300]]


func _on_Timer_timeout() -> void:
	# Choose a random entity
	var entity_to_instance = Utils.choose_random_from_array(entity_array)
	var spawn_range = Utils.choose_random_from_array(lanes)
	var rand_y = rand_range(spawn_range[0], spawn_range[1]) 
		
	var random_vector = Vector2(-10, rand_y)
	Utils.add_instance_to_scene(entity_to_instance, random_vector)
