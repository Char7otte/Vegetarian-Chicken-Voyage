extends Node

@export var objects_with_tasks: Array[StaticBody3D]

func _ready():
	var random_number: int
	
	for object in objects_with_tasks:
		var task_component = object.get_node("TaskComponent")
		
		random_number = randi_range(0, 1)
		
		if random_number == 0:
			print("Skipping: " + object.name)
			task_component.deactivate_interaction()
		else: 
			print("Activating: " + object.name)
			task_component.activate_interaction()
