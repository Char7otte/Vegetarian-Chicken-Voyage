extends Control

@export var task_template: PackedScene

#@onready var tasks_parent = %TasksVBox

func add_tasks(tasks):
	var task_count = tasks.size()
	var task_instruction_labels = instantiate_task_scene(task_count)
	
	#var for_loop_count = 0
	#for task in tasks:
		#var task_label = task_labels[for_loop_count]
		#task_label.set_visible(true)
		#var task_label_number = task_label.text
		#task_label.set_text(task_label_number + task)

func instantiate_task_scene(task_count):
	var task_instruction_labels: Array[Label]
	
	for i in range(task_count):
		var task_template_instance = task_template.instantiate()
		get_child(0).add_child(task_template_instance)
		var task_instruction_label = task_template_instance.get_node("TaskInstructions")
		task_instruction_label.set_text("This has been added.")
		task_instruction_labels.append(task_instruction_label)
	
	return task_instruction_labels
