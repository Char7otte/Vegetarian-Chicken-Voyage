extends Node

@export var objects_with_tasks: Array[StaticBody3D]

#var number_of_tasks_to_generate: int
var task_component: TaskComponent

func _ready():
	var random_number_generator = RandomNumberGenerator.new()
	var random_number: int
	
	for object in objects_with_tasks:
		random_number = randi_range(0, 1)
		print(random_number)
		if random_number == 0:
			print("Skipping: " + object.name)
			continue;
		else: 
			print("Activating: " + object.name)
			task_component = object.get_node("TaskComponent")
			task_component.is_activated = 1
