extends Node

func add_instance_to_scene(sceneToAdd, position, container = get_tree().current_scene):
	var instance = sceneToAdd.instance()
	
	container.add_child(instance)
	instance.global_position = position
	
	return instance

func rand_between_to_nums(randMin: int = 0, randMax: int = 100) -> int:
	var rand = floor(rand_range(randMin, randMax))
	return rand
