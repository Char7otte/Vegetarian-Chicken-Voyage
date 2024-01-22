extends Control


func _ready():
	hide()
	task_manager.all_tasks_finished.connect(on_all_tasks_finished)

func on_all_tasks_finished():
	show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
