extends Control

@export var task_template: PackedScene

func instantiate_task_scene(task_message, task_number):
		var task_template_instance = task_template.instantiate()
		get_child(0).add_child(task_template_instance)
		
		var task_number_label = task_template_instance.get_node("TaskNumber")
		task_number_label.set_text(str(task_number + 1))
		
		var task_instruction_label = task_template_instance.get_node("TaskInstructions")
		task_instruction_label.set_text(task_message)
