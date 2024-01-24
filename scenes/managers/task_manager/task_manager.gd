extends Node

signal task_completed(task_id)
signal all_tasks_finished

@onready var game_manager = get_node("/root/GameManager")
@onready var task_objects_group = get_tree().get_nodes_in_group("InteractableObjects")
@onready var task_list = %TaskList

var task_count: int

func _ready():
	task_count = calculate_task_count(game_manager.days_counter, game_manager.task_day_multiplier)
	generate_task_objects(task_count)

func calculate_task_count(day, multiplier):
	var count = day * multiplier
	var task_group_size = task_objects_group.size()
	if count >= task_group_size:
		count = task_group_size
		print("Task limit reached")
	return count

func generate_task_objects(_task_count):
	for i in range(_task_count):
		var selected_task_task_component = select_random_task()
		selected_task_task_component.activate_interaction()
		
		selected_task_task_component.task_id = i
		selected_task_task_component.task_completed.connect(on_task_completed)
		
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
	
	check_if_all_tasks_are_completed()

func check_if_all_tasks_are_completed():
	task_count -= 1
	if task_count <= 0:
		all_tasks_finished.emit()
		game_manager.disable_gameplay_nodes()
