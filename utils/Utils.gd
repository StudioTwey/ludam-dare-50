extends Node

func add_instance_to_scene(sceneToAdd, position, container = get_tree().current_scene):
	var instance = sceneToAdd.instance()
	
	container.add_child(instance)
	instance.global_position = position
	
	return instance

func choose_random_from_array(array: Array):
	return array[randi() % array.size()]

func get_player_pos():
	var player_pos = get_node("/root/Game/Player").position
	
	return player_pos
