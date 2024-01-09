extends Control

@onready var task_labels_parent = $VBoxContainer
@onready var task_labels = $VBoxContainer.get_children()

func add_task(new_tasks_array):
	var for_loop_count = 0
	for task in new_tasks_array:
		var task_label = task_labels[for_loop_count]
		task_label.set_visible(true)
		var task_label_number = task_label.text
		task_label.set_text(task_label_number + task)
