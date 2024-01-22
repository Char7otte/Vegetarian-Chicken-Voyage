extends Node


@onready var game_manager = get_node("/root/GameManager")
@onready var task_objects_group = get_tree().get_nodes_in_group("InteractableObjects")

var tasks_for_the_day = []

func _ready():
	game_manager.task_count_generated.connect(on_task_count_generated)

func on_task_count_generated(task_count):
	for i in range(task_count):
		var selected_task_task_component = select_random_task()
		selected_task_task_component.activate_interaction()
		
		selected_task_task_component.task_number = i
		
		var task_list = get_tree().get_first_node_in_group("task_list")
		task_list.instantiate_task_scene(selected_task_task_component.task_message, i)
	
	for task in task_objects_group:
		task.disable_interaction()

func select_random_task():
	task_objects_group.shuffle()
	var selected_task_object = task_objects_group[0]
	task_objects_group.erase(selected_task_object)
	return selected_task_object
