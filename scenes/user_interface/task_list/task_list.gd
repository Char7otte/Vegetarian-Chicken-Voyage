extends Control

@export var task_template: PackedScene

func instantiate_task_scene(task_message):
		var task_template_instance = task_template.instantiate()
		get_child(0).add_child(task_template_instance)
		var task_instruction_label = task_template_instance.get_node("TaskInstructions")
		task_instruction_label.set_text(task_message)

