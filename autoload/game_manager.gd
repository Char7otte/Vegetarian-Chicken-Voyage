extends Node

@export var task_day_multiplier = 2
@export var days_counter = 1
var day_task_count: int

func _ready():
	calculate_tasks_for_day()

func calculate_tasks_for_day():
	day_task_count = days_counter * task_day_multiplier
	print(day_task_count)
