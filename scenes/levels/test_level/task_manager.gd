extends Node

func _ready():
	await get_tree().create_timer(0.1).timeout
	print("Starting Task Manager.")
	
	var objects_with_tasks_group = get_tree().get_nodes_in_group("InteractableObjects")
	
	for object in objects_with_tasks_group:
		var task_component = object.get_node("TaskComponent")
		var random_number = randi_range(0, 1)
		
		if random_number == 0:
			task_component.deactivate_interaction()
		else: 
			task_component.activate_interaction()
