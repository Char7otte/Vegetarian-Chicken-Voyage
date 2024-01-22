extends Control


func _ready():
	hide()
	
	task_manager.all_tasks_finished.connect(on_all_tasks_finished)
	next_level_button.pressed.connect(on_next_level_button_pressed)

func on_all_tasks_finished():
	show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func on_next_level_button_pressed():
	game_manager.go_to_next_level()
	get_tree().reload_current_scene()
