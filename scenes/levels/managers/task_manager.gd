extends Node

signal task_completed(task_id)

@onready var game_manager = get_node("/root/GameManager")
@onready var task_objects_group = get_tree().get_nodes_in_group("InteractableObjects")

func _ready():
	var task_count = calculate_task_count(game_manager.days_counter, game_manager.task_day_multiplier)
	generate_task_objects(task_count)

func calculate_task_count(day, multiplier):
	return day * multiplier

func generate_task_objects(task_count):
	for i in range(task_count):
		var selected_task_task_component = select_random_task()
		selected_task_task_component.activate_interaction()
		
		selected_task_task_component.task_id = i
		
		var task_list = get_tree().get_first_node_in_group("task_list")
		task_list.instantiate_task_scene(selected_task_task_component.task_message, i)
	
	for task in task_objects_group:
		task.disable_interaction()

func select_random_task():
	task_objects_group.shuffle()
	var selected_task_object = task_objects_group[0]
	task_objects_group.erase(selected_task_object)
	return selected_task_object
