extends Control


func _ready():
	hide()

func on_all_tasks_finished():
	show()
