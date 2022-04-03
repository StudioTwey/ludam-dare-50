extends Node2D

onready var timer = $Timer

export(Array, PackedScene) var entity_array
export var is_horizontal := true

var lanes = [[20,70], [90, 150], [200, 300]]

func _ready() -> void:
	randomize()

func _on_Timer_timeout() -> void:
	var entity_to_instance = Utils.choose_random_from_array(entity_array)
	var spawn_range = Utils.choose_random_from_array(lanes)
	var rand_coord = rand_range(spawn_range[0], spawn_range[1]) 
	
	var random_vector = Vector2(-10, rand_coord) if is_horizontal else Vector2(rand_coord, -10)
	Utils.add_instance_to_scene(entity_to_instance, random_vector, self)
