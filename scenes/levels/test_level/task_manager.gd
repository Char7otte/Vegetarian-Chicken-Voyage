extends Node

@onready var game_manager = get_node("/root/GameManager")
@onready var task_objects_group = get_tree().get_nodes_in_group("InteractableObjects")

var tasks_for_the_day = []

func _ready():
	game_manager.task_count_generated.connect(activate_tasks)

func select_random_task():
	task_objects_group.shuffle()
	var selected_task_object = task_objects_group[0]
	task_objects_group.erase(selected_task_object)
	return selected_task_object

func activate_tasks(task_count):
	for i in range(task_count):
		var selected_task_task_component = select_random_task()
		tasks_for_the_day.append(selected_task_task_component)
		task_objects_group.erase(selected_task_task_component)
	
	for task in tasks_for_the_day:
		task.activate_interaction()
		print(task.task_message)
	
	assign_tasks_to_task_list(tasks_for_the_day)
	
	for task in task_objects_group:
		task.deactivate_interaction()

func assign_tasks_to_task_list(tasks):
	var task_list = get_tree().get_first_node_in_group("task_list")
	if task_list == null:
		print("Task list missing.")
		return
	
	task_list.add_tasks(tasks)
