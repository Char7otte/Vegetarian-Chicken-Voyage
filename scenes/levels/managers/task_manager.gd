extends Node

signal task_completed(task_id)

@onready var game_manager = get_node("/root/GameManager")
@onready var task_objects_group = get_tree().get_nodes_in_group("InteractableObjects")

func _ready():
	var task_count = calculate_task_count(game_manager.days_counter, game_manager.task_day_multiplier)
	generate_task_objects(task_count)

func calculate_task_count(day, multiplier):
	var count = day * multiplier
	return count

func generate_task_objects(_task_count):
	for i in range(_task_count):
		var selected_task_task_component = select_random_task()
		selected_task_task_component.activate_interaction()
		
		selected_task_task_component.task_id = i
		selected_task_task_component.task_completed.connect(on_task_completed)
		
		var task_list = get_tree().get_first_node_in_group("task_list")
		task_list.instantiate_task_scene(selected_task_task_component.task_message, i)
	
	disable_unused_objects()

func select_random_task():
	task_objects_group.shuffle()
	var selected_task_object = task_objects_group[0]
	task_objects_group.erase(selected_task_object)
	return selected_task_object

func disable_unused_objects():
	for task in task_objects_group:
		task.disable_interaction()

func on_task_completed(task_id):
	task_completed.emit(task_id)
