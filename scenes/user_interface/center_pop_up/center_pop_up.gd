extends Control


func _ready():
	hide()

func on_all_tasks_finished():
	show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
